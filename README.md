Table of Contents
=================

* [Introduction](#introduction)
* [Configuration](#configuration)
  * [g:goldendict\_path](#ggoldendict_path)
* [Mappings](#mappings)
  * [&lt;Plug&gt;(goldendict\-lookup\-cursor)](#pluggoldendict-lookup-cursor)
  * [&lt;Plug&gt;(goldendict\-lookup\-visual)](#pluggoldendict-lookup-visual)
* [Usage](#usage)
* [License](#license)
* [Bugs](#bugs)
* [Contributing](#contributing)
* [Changelog](#changelog)

# Introduction

GoldenDict is a cross-platform dictionary program. This plugin is a vim/neovim
interface of goldendict.

You can find more infomation on the official website and the Github of
GoldenDict:
* Official website: http://goldendict.org/
* Github: https://github.com/goldendict/goldendict/

# Configuration

You can configure the following settings to change how vim-goldendict works.

## `g:goldendict_path`

The path of the goldendict.

Default: `goldendict`

Example:

```vim
if has('win32')
    let g:goldendict_path = 'C:\Program Files\GoldenDict\GoldenDict.exe'
else
    let g:goldendict_path = 'goldendict'
endif
```

# Mappings

## `<Plug>(goldendict-lookup-cursor)`

Lookup the word under the cursor when not in visual or select mode.

## `<Plug>(goldendict-lookup-visual)`

Lookup the content of the selected text when in visual mode.

# Usage

Add the following settings to your $HOME/.vimrc:

```vim
imap <F1> <C-\><C-O><Plug>(goldendict-lookup-cursor)
nmap <F1> <Plug>(goldendict-lookup-cursor)
vmap <F1> <C-G><Plug>(goldendict-lookup-visual)<C-G>
```

Then you can press <kbd>F1</kbd> key to lookup word. When in visual or select
mode, the word would be the content of the selected text, otherwise would be
the word under the cursor.

You can change <kbd>F1</kbd> to any key(s) you like.

# License

[vim-goldendict](https://github.com/spindensity/vim-goldendict/) is MIT licensed.

# Bugs

If you find a bug please post it on the issue tracker:
http://github.com/spindensity/vim-goldendict/issues/

# Contributing

Think you can make this plugin better?  Awesome!

Email a patch to spindensity@gmail.com or send a pull request.

GitHub: https://github.com/spindensity/vim-goldendict/

# Changelog

v0.1
* Initial release.
