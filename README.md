# Neovim init.vim

## インストールとアンインストール

Neovim がインストールされているものとします。


## フォント

コンソールアプリケーションとの関係もあり、以下の二通りで使っています。

1. Conemu + Cica フォント

この環境では色つき絵文字フォントを使うことはできませんが、それ以外は満足しています。

2. Windows Terminal + Cascadia Code (+NERD Font)

こちらは試用している最中ですが、なにより絵文字フォントをカラーで使うことができるため、そういったファンシーさをターミナルに求める場合はよいと思います。
日本語は正しく表示されているように思えますが、美しいわけではありません。

* Windows Terminal (https://github.com/microsoft/terminal/releases)
* Cascadia Code(+NERD Font) (https://github.com/ryanoasis/nerd-fonts/releases)


## キーマッピング

以下キーマッピングの設定にある [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) は `,` で設定されています。

したがって `<leader>` は `,` と読み替えて入力してください。
たとえば `<leader>o` とは、`,o` と入力する、ということです。

また、`c-` は ctrl ボタンを意味します。`<c-a>` のような記述の場合、ctrl ボタンを押しながら a を押す、 という意味です。

| 表記              | キー                          |
|-------------------|-------------------------------|
|`<leader>`         | `,`                           |
|`<space>`          | スペースキー                  |
|`<cr>`             | エンターキー                  |


## プラグイン

### [fern](https://github.com/lambdalisue/fern.vim)

ファイラーです。

#### キーマップ

| 表記              | キー                          |
|-------------------|-------------------------------|
|`<leader>nn`       | フォルダツリーを左に表示      |
|`j`                | ツリーを下へ移動              |
|`k`                | ツリーを上へ移動              |
|`l`                | フォルダを開く                |
|`h`                | フォルダを閉じる              |
|`<enter>`          | 選択フォルダの階層へ移動      |
|`c-h`              | 親フォルダの階層へ移動        |
|`e`                | ファイルを開く                |
|`-`                | ファイルを選択                |
|`<shift>c`         | ファイルをコピー              |
|`<shift>m`         | ファイルをカット              |
|`<shift>p`         | ファイルをペースト            |
|`<shift>d`         | ファイルを削除                |
|`<shift>r`         | ファイルをリネーム            |
|`!`                | 隠しファイルを表示/非表示     |
|`?`                | ヘルプ                        |

### [fern-bookmark](https://github.com/lambdalisue/fern-bookmark.vim)

fern 用のブックマーク機能用プラグインです。

#### キーマップ

| 表記              | キー                          |
|-------------------|-------------------------------|
|`<leader>nb`       | ブックマークツリーを表示      |


