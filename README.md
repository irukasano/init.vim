# Neovim init.vim

## インストールとアンインストール

### neovim インストール

    $ sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext
    $ sudo yum install php-curl php-dom

    $ git clone https://github.com/neovim/neovim.git

    $ cd neovim
    $ make CMAKE_BUILD_TYPE=RelWithDebInfo
    $ sudo make install

### neovim の環境を確認

    $ nvim

        :checkhealth

### neovim + pynvim

    $ curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py
    $ python get-pip.py

    $ pip2 install pynvim
    $ pip3 install pynvim
    $ npm install -g neovim

### neovim + nodejs

    $ sudo apt install nodejs npm
    $ sudo npm install n -g
    $ sudo n stable
    $ sudo apt purge -y nodejs npm
    $ exec $SHELL -l
    $ node -v

    $ sudo npm install -g neovim

### this repo

    $ mkdir ~/.config
    $ cd ~/.config
    $ git clone https://github.com/irukasano/init.vim nvim

    $ nvim 
        nvim を起動するとすべてのプラグインがインストールされるので一旦終了し、再度 nvim 起動する


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

| 表記              | キー                                |
|-------------------|-------------------------------------|
|`<leader>`         | `,`                                 |
|`<space>`          | スペースキー                        |
|`<cr>`             | エンターキー                        |


## プラグイン

### [fern](https://github.com/lambdalisue/fern.vim)

ファイラーです。

#### キーマップ

| 表記              | キー                                |
|-------------------|-------------------------------------|
|`<leader>nn`       | フォルダツリーを左に表示            |
|`j`                | ツリーを下へ移動                    |
|`k`                | ツリーを上へ移動                    |
|`l`                | フォルダを開く                      |
|`h`                | フォルダを閉じる                    |
|`<enter>`          | 選択フォルダの階層へ移動            |
|`c-h`              | 親フォルダの階層へ移動              |
|`e`                | ファイルを開く                      |
|`t`                | 別タブでファイルを開く              |
|`-`                | ファイルを選択                      |
|`<shift>c`         | ファイルをコピー                    |
|`<shift>m`         | ファイルをカット                    |
|`<shift>p`         | ファイルをペースト                  |
|`<shift>d`         | ファイルを削除                      |
|`<shift>r`         | ファイルをリネーム                  |
|`!`                | 隠しファイルを表示/非表示           |
|`?`                | ヘルプ                              |

### [fern-bookmark](https://github.com/lambdalisue/fern-bookmark.vim)

fern 用のブックマーク機能用プラグインです。

#### キーマップ

| 表記              | キー                                |
|-------------------|-------------------------------------|
|`<leader>nb`       | ブックマークツリーを表示            |


### [coc](https://github.com/neoclide/coc.nvim)

オートコンプリート等多機能プラグインです。

#### キーマップ

| 表記              | キー                                |
|-------------------|-------------------------------------|
|(入力すると自動)   | オートコンプリート                  |
|`c-n`              | 次の候補                            |
|`c-p`              | 前の候補                            |
|`<leader><leader>` | Cocリスト                           |
|`<leader>def`      | カーソル下の定義を表示              |
|`<leader>ref`      | カーソル下の参照リストを表示        |
|`<leader>ren`      | カーソル下の変数名を一括変更        |
|`<leader>fmt`      | 整形                                |
|`<leader>imp`      | coc-implementation                  |
|`K`                | カーソル下の定義を表示              |
|`c-f`              | ウィンドウ位置を下スクロール        |
|`c-b`              | ウィンドウ表示位置を上スクロール    |

### [fzf](https://github.com/junegunn/fzf)
### [fzf](https://github.com/junegunn/fzf.vim)
### [fzf](https://github.com/antoinemadec/coc-fzf)

#### キーマップ

| 表記              | キー                                |
|-------------------|-------------------------------------|
|`<leader>fa`       | ファイル名と内容を検索              |
|`<leader>fp`       | プロジェクトファイルを検索          |
|`<leader>fb`       | バッファを検索                      |
|`<leader>fh`       | 履歴を検索                          |
|`<leader>fc`       | Git Commit                          |
|`<leader>fs`       | git status                          |

### [fugitive](https://github.com/tpope/vim-fugitive')

Git 操作用のプラグインです。

#### キーマップ

| 表記              | キー                                |
|-------------------|-------------------------------------|
|`<leader>gs`       | Git status                          |
|`<leader>gb`       | Git blame                           |
|`<leader>gd`       | Git diff                            |

