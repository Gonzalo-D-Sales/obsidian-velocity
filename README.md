![poster](./assets/poster.png)

<h2 align="center">The theme of tomorrow, in your hands today.</h2>

<p align="center"> Velocity is a sleek and futuristic theme for <a href="https://obsidian.md">Obsidian</a>—born out of a relentless, one-year-long pursuit of design perfection. See for yourself what it's like to use a truly <i>next-generation theme</i>, and take your note-taking experience to a whole new level. </p> 

<br>

<p align="center"> Check out the <strong>News</strong> section of this README for the latest updates and announcements. </p> 

### Table of Contents

- [News](#News-)
- [FAQ](#FAQ-)
- [Features](#Features-)
- [Background](#Background-)
- [Credits](#Credits-)

<br>

![Markdown](./assets/markdown.png)
![Multiple tabs](./assets/multitask.png)
![Graph Controls](./assets/graph-controls.png)
![Bases](./assets/bases.png)
![Command Palette](./assets/command-palette.png)

<br>

## News [^](#Table-of-Contents)
As of January 2026, **the latest release** is `Velocity 2.0.0`.

After over three months of continuous development since `1.3.0-beta`, 2.0.0 brings a **fresh new look** and massively refined user experience. Additionally, **full support** for phones and tablets is now available, ensuring all platforms get the same treatment and care.

Check out the [release page for 2.0.0](https://github.com/Gonzalo-D-Sales/obsidian-velocity/releases/tag/v2.0.0) for the full list of new features, improvements and fixes.

> [!CAUTION] 
> Velocity has been designed for and tested in the very latest insider versions of Obsidian, some of which have introduced breaking changes to the UI. Because Obsidian 1.13 has not yet released publicly, the **settings menu interface will be broken for many users.** However, other parts of the app should appear as usual.

<br>

### Issues Policy

Although you are free to send issues and feature requests at any time, these will only be read and worked on **during weekends.**  

There is no guarantee that an issue/FR will be completed on the same week that it was posted. I will do my best to address bugs and issues, but I have work to do outside of theme development, too.

<br>

## FAQ [^](#Table-of-Contents)

**1) How can I customize the theme?**
> Download the **Style Settings** plugin from within the Obsidian app's plugin store. The plugin is free and the settings for Velocity should appear automatically so long as you have the theme enabled.
> - Choose the **Quick Settings** to easily change layout and colors.
> - Choose the **Configurator** to dive deeper into Velocity's features.

**2) How can I change the font / why are my custom fonts not working?**
> Go to the **Quick Settings**, and enable the toggle to **"Override dedicated theme typeface".**  
> - Velocity has been designed and tweaked around the font it is bundled with. It is highly encouraged to first experience Velocity the way it is meant to look before changing the font, which may introduce visual bugs and imperfections.

**3) What kind of user is this theme designed for?**
> Velocity is designed for creatives, thinkers and note-takers of all kinds. If you want your vault to look premium and polished, like it's straight out of a native macOS app, then Velocity can do just that (and so much more!) 

**4) How long have you been working on this?**
> Around **one year and two months**, as of the release of `2.0.0`.

**5) Will you add _____ feature to Velocity?**
> Features are added on a case-by-case basis.
> - Certain popular features, such as _rainbow folders and headings_, have been **intentionally left out** because they conflict with Velocity's visual identity. 
> - Please make requests for features in the GitHub **Issues** tab, or in the Obsidian **Discord** thread for Velocity.

**6) Will this theme break or interfere with plugins?**
> Velocity **may interfere with the styling of some plugins' settings** or menus in a way that is not intended or aesthetic. This is a necessary tradeoff when designing a theme which makes significant alterations to the user interface.  
> - Testing has shown that most plugins work normally with Velocity. The worst issues you may experience are minor visual bugs or misaligned elements, but plugin functionality should be **unaffected.**
 
**7) Why does it look so much like the _____ theme?**
> Velocity has been created with multiple inspirations in mind, including various themes I have used for my own vaults in the past.   
> - The full list of works which have inspired Velocity are listed in the Credits section of the README. **Any other resemblances are purely coincidental.**

<br>

## Features [^](#Table-of-Contents)

### CSSClasses

Velocity comes with a set of **CSSclasses** which can be used to alter the styling of elements on a note-by-note basis:

| Name                  | Function                                                   |
| :-------------------- | :----------------------------------------------------------|
| `override`            | Quick utility to disable any other cssclasses in the note. |
| `hide-metadata`       | Hides any properties visible in the note.                  |
| `hide-title`          | Hides the inline-title for that particular note.           |
| `show-title`          | Shows the inline-title for that particular note.           |
| `style-justify` / `justified` | Justifies paragraph, blockquote and callout text.  |
| `style-margin-top`    | Adds additional padding to the top of the note.            |
| `style-wide`  | Sets maximum note width, equivalent to disabling readable width.   |
| `large-heading`        | Turns editor H1 into a larger heading.         |
| `super-heading`          | Like `large-heading`, but with bolder type and no underline. |
| `simple-title`        | Gives the inline title the standard heading style.         |

<br>

### Auto-Hide

Velocity comes with a novel feature first pioneered in **[Micro Mike](https://github.com/ThisTheThe/MicroMike)**: the ability to automatically hide the sidebars whenever the window's width is too narrow. This prevents the main panel from becoming too cramped or unreadable.

**Auto-Hide can be disabled** in the theme's Style Settings.

![Autohide](./assets/autohide.gif)

<br>

### Math Callouts

Velocity provides an alternative callout style inspired by the outlined look seen in most mathematics textbooks. To use a math callout, **manually set the callout type** to ``> [!math]``. To change the color, **append a dash followed by the color name;** for example, ``> [!math-red]``. 

Valid colors include all the default rainbow colors included in Obsidian by default, from `red` to `pink`.

<br>

### Planned Features

- [x] Several color schemes for light and dark mode
- [x] Full support for mobile devices
- [ ] Partial implementation of Damian Korcz's **[Alternative Checkboxes](github.com/damiankorcz/Alternative-Checkboxes-Reference-Set)** reference set

<br>

## Background [^](#Table-of-Contents)

Let me let you in on a little secret: Velocity may be a theme about the future, but what I didn't mention is just what *kind* of future(s).
<br>

Velocity was, in fact, intially born out of a desire to recreate the _future as envisioned in the 2000s_; that is, Velocity was once a **retro-futuristic theme**, complete with period-appropriate tactile decorations and shiny gradients. The earliest versions genuinely looked like the interface of an old racing game, hence the name "Velocity".
<br>

As time passed, my focus shifted away from recapturing childhood nostalgia and dreams of an old future. I began pursuing _modernization and refinement_, slowly introducing contemporary design sensibilities over the months and even overhauling Velocity's entire underlying structure at one point. I wanted to make a **world-class** theme for Obsidian, not just a fun passion project for myself anymore. The end result is a theme that I have poured my heart and soul into, and sacrificed so much time to make... but one which does not appear to reflect these struggles. I designed Velocity to be _cold, austere and near-totally neutral_—and perhaps I have succeeded in that goal.
<br>

Even now—in its watered-down and refined, modern form—Velocity still carries _a bit of that energy_, a bit of the future of yesterday. The theme has now gone through **four distinct incarnations** or 'generations' of development, and telling the whole story here is going to be impossible. Therefore, **I will link a blog post or something else** here if I ever do get around to writing everything down. 
<br>

In the end—despite it all—**I do not regret making Velocity**, nor do I regret the direction I ended up taking the theme down.

<br>

## Credits [^](#Table-of-Contents)

### Themes:

**[Sanctum](https://github.com/jdanielmourao/obsidian-sanctum)** - the main theme I used in the past and a major influence on Velocity's typography, as well as its choice of icon modifications. 

**[Border](https://github.com/Akifyss/obsidian-border), [Mado](https://github.com/hydescarf/Obsidian-Theme-Mado-Miniflow), [Composer](https://github.com/vran-dev/obsidian-composer)** - major influences and sources of code for earlier versions of Velocity. While no Mado or Border, or Composer code remains in Velocity, I wouldn't have managed to get the theme to this state without learning from their example.

**[Primary](https://github.com/primary-theme/obsidian)** - Primary informs this theme's perfectionism, its synthesis of traditional modernist movements and new aesthetic subcultures, and my approach to never leave any detail untouched.

**[Cupertino](https://github.com/aaaaalexis/obsidian-cupertino)** - A modern and influential macOS-inspired theme. Velocity's interaction design and overall layout is strongly inspired by this theme. 

**[Willemstad](https://github.com/tingmelvin/willemstad-x)** - a source of inspiration for the modified community themes page in both old and new versions of Velocity. 

**[Micro Mike](https://github.com/ThisTheThe/MicroMike)** - its "mini-mode" is the basis for Velocity's Auto-hide feature.

**[Maple](https://github.com/subframe7536/obsidian-theme-maple)** - Velocity takes inspiration from Maple's unique document search styling.

**[CreArts](https://github.com/CreArts-Community/CreArts-Obsidian)** - The idea of adding a preview image for each of Velocity's paint schemes originally came from this theme.

<br>

### People:

**[bladeacer](https://github.com/bladeacer) -** One of my closest friends and fellow theme developers, who is also developing his own theme, [Flexcyon](https://github.com/bladeacer/flexcyon). He has been there with me since the beginning, and has helped me by testing and critiquing my work. He even convinced me (after much initial resistance) to convert my plain CSS codebase to a more structured SCSS setup. 
<br>

**[kapirklaa](https://github.com/ElsaTam) -** Another friend of mine and theme developer; she designed the stylish fan-favorite [Fancy-a-Story](https://github.com/ElsaTam/obsidian-fancy-a-story). I owe a lot to her because of the help and advice she offered back when I was very new to CSS, and I am sure there would be no Velocity were it not for her kindness and generosity.
<br>

**The first few alpha-testers for Velocity -** This is a group of maybe around 5-10 individuals who not only tested the theme in its humble infancy, but also mostly stuck around and still use the modern Velocity to this day. Thank you very much for your support, you gave me the motivation to keep on developing Velocity through all those months.
