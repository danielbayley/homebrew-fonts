_[Homebrew]_ Fonts
==================
Extra fonts with [Homebrew].

Install
-------
~~~ sh
brew tap danielbayley/fonts
brew cask install #font-token
~~~

`system_profiler SPFontsDataType` will give you a list of installed fonts with detailed information, including the PostScript name you might need for your preferred editor or terminal. Using _[Fira Code]_ for example, `system_profiler SPFontsDataType | grep Fira` would give you `FiraCode-Retina`. You can also run `fc-scan --format %{postscriptname}` directly on the font file.

[Atom]:
~~~ coffee
# ${ATOM_HOME:-~/.atom}/config.cson
editor:
  fontFamily: "FiraCode-Retina, monospace"
~~~

[VS Code]:
~~~ js
// ${VSCODE_APPDATA:-~/Library/Application Support}/{Code,VSCodium}/User/settings.json
"editor.fontFamily": "FiraCode-Retina, monospace",
"editor.fontLigatures": true,
~~~

[Hyper]:
~~~ js
// ~/.hyper.js
fontFamily: 'FiraCode-Retina, monospace',
~~~

[Contribute][guide]
-------------------
Follow the contribution [guide], or copy and adapt an [existing] _[Cask]_.

License
-------
[MIT] © [Daniel Bayley]

[MIT]:              LICENSE.md
[Daniel Bayley]:    https://github.com/danielbayley

[homebrew]:         https://brew.sh
[cask]:             https://docs.brew.sh/Formula-Cookbook#homebrew-terminology

[guide]:            https://github.com/caskroom/homebrew-cask/blob/master/doc/development/adding_a_cask.md
[existing]:         Casks

[atom]:             https://atom.io
[vs code]:          https://code.visualstudio.com
[hyper]:            https://hyper.is

[fira code]:        https://github.com/tonsky/FiraCode
