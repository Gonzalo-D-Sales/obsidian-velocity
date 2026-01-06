import 'dart:async';
import 'dart:io';
import 'package:sass/sass.dart' as sass;

// Lightweight CLI tool to compile the theme SCSS and append a settings CSS
// fragment. Includes a `--watch` mode that monitors the SCSS tree and the
// settings file so updates to either trigger a rebuild.

/// Compile the SCSS entry file at [scssPath] using compressed output,
/// then append the contents of [settingsCssPath] (if it exists) and
/// write the combined result to [outPath].
///
/// Returns the combined CSS string.
String compile(String scssPath, String settingsCssPath, String outPath) {
  // Compile SCSS to compressed CSS and return the combined result.
  final result = sass.compileToResult(scssPath, style: sass.OutputStyle.compressed);
  final compiled = result.css;

  final settingsFile = File(settingsCssPath);
  final settingsCss = settingsFile.existsSync() ? settingsFile.readAsStringSync() : '';

  final combined = settingsCss.isNotEmpty ? '$compiled\n$settingsCss' : compiled;

  File(outPath).writeAsStringSync(combined);
  return combined;
}

void _info(String msg) => stdout.writeln(msg);
void _error(String msg) => stderr.writeln(msg);

void _printUsage() {
  stderr.writeln('Usage: dart compile.dart <scss-entry> <settings-css> <out-css>');
  stderr.writeln('Example: dart compile.dart src/theme.scss src/style-settings.scss theme.css');
}

/// CLI entrypoint so this file can be run directly.
///
/// Attempts to compile the given SCSS entry file and append the settings CSS.
Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    _printUsage();
    exit(2);
  }

  if (args[0] == '--watch') {
    if (args.length != 4) {
      _printUsage();
      exit(2);
    }

    final scssPath = args[1];
    final settingsPath = args[2];
    final outPath = args[3];

    // initial build
    try {
      final css = compile(scssPath, settingsPath, outPath);
      _info('Initial build: wrote $outPath (${css.length} bytes)');
    } on sass.SassException catch (e) {
      _error('Sass error: ${e.message}');
      _error(e.span.toString());
    } catch (e) {
      _error('Error: $e');
    }

    // Collect directories to watch: watch the `src` tree (all subdirectories)
    final watchDirs = <Directory>{};
    final srcRoot = Directory('src');
    if (srcRoot.existsSync()) {
      watchDirs.add(srcRoot);
      // gather all subdirectories under src
      await for (final entity in srcRoot.list(recursive: true, followLinks: false)) {
        if (entity is Directory) watchDirs.add(entity);
      }
    } else {
      // fallback to watching the SCSS entry's parent if src isn't found
      watchDirs.add(File(scssPath).parent);
    }

    _info('Watching for changes');

    // Shared debounce timer for rebuilds
    Timer? debounce;
    final subs = <StreamSubscription<FileSystemEvent>>[];

    void scheduleRebuild(String causePath) {
      debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 250), () {
        try {
          final css = compile(scssPath, settingsPath, outPath);
          _info('Rebuilt (trigger: $causePath): wrote $outPath (${css.length} bytes)');
        } on sass.SassException catch (e) {
          _error('Sass error: ${e.message}');
        } catch (e) {
          _error('Error: $e');
        }
      });
    }

    for (final dir in watchDirs) {
      if (!dir.existsSync()) continue;
      final sub = dir.watch(recursive: true).listen((event) {
        final p = event.path;
        // Trigger on SCSS changes or explicit settings file change
        if (p.endsWith('.scss') || p == settingsPath) {
          scheduleRebuild(p);
        }
      });
      subs.add(sub);
    }

    // Handle Ctrl-C
    final done = Completer<void>();
    ProcessSignal.sigint.watch().listen((_) async {
      for (final s in subs) await s.cancel();
      debounce?.cancel();
      _info('\nWatcher stopped.');
      done.complete();
    });

    // Keep process alive until signal.
    await done.future;
    exit(3);
  }

  // Non-watch one-shot
  if (args.length != 3) {
    _printUsage();
    exit(2);
  }

  final scssPath = args[0];
  final settingsPath = args[1];
  final outPath = args[2];

  try {
    final css = compile(scssPath, settingsPath, outPath);
    _info('Wrote $outPath (${css.length} bytes)');
  } on sass.SassException catch (e) {
    _error('Sass error: ${e.message}');
    _error(e.span.toString());
    exit(1);
  } catch (e) {
    _error('Error: $e');
    exit(1);
  }
}