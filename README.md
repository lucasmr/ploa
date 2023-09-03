## Optimizing Portuguese keyboard input in X11 / Linux

Summary:
- Removes unused diacritics in Portuguese for all layouts
- Fixes diaeresis key in layout "English (US)", variant "English (US, intl., with dead keys)"

After the Portuguese Language Orthographic Agreement of 1990, the use of diaeresis (¨) in all words should be eliminated, except from names containing it. However, if you use the keyboard "English (US)", variant "English (US, intl., with dead keys)", the key combination [shift] + ['] is a  dead key for diaeresis. To fix that, this script modifies "/usr/share/X11/xkb/symbols/us" to make the combination [shift] + ['] form the character ("). The dead key for diaeresis is still accessible through [r_alt] + [shift] + ['].

Also, many dead key compositions are not used in Portuguese. The only letters with diacritics used are:

á Á é É í Í ó Ó ú Ú ç Ç

â Â ê Ê ô Ô

ã Ã õ Õ

à À

This script creates the file ~/.XCompose to override other dead key compositions. This file works with any keyboard layout, even ABNT2 PT-BR variants. Because this is tied to the en_US.UTF-8 locale, to restore the default behavior you have to delete the .XCompose file and restart the X session.

To use this script, just clone the repository and execute it:
```
$ cd
$ git clone hhttps://github.com/lucasmr/ploa.git
$ cd ploa
$ chmod +x script.sh
$ ./script.sh
```
Restart your X session and select the correct keyboard layout and variant in your input manager.

Remember that system updates might overwrite these changes, so just run the script again to reapply.

### References:

https://www.freedesktop.org/wiki/Software/XKeyboardConfig/

https://en.wikipedia.org/wiki/Compose_key

https://en.wikipedia.org/wiki/Portuguese_Language_Orthographic_Agreement_of_1990

