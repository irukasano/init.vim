# Todo

- [x] Neovim の既存設定から `paste` 関連の定義箇所を確認する
- [x] デフォルトで `paste` モードになるよう設定を追加する
- [x] 設定ファイルを確認して変更内容を検証する

### 2026-04-21: tmux 内で `tig status` を下ペインで開く

- [x] 既存の Git キーマップ定義箇所を確認する
- [x] `<leader>gt` から呼び出す tmux/tig 判定付きの処理を追加する
- [x] headless で設定読み込みとマップ定義を検証する

### 2026-04-21: 全角スペースを控えめな下線で可視化する

- [x] 既存の空白表示設定と配色適用箇所を確認する
- [x] 全角スペース専用の控えめな下線表示を追加する
- [x] headless で設定読み込みとハイライト定義を検証する

# Review

- `initvims/basic.vim` に `set paste` を追加し、起動直後から貼り付け時の自動インデントを抑止するようにした
- 既存の `<leader>pp` トグルはそのまま残し、必要時に手動で切り替え可能

### 2026-04-21: tmux 内で `tig status` を下ペインで開く

- 原因
  - Git 操作用の既存マッピングはあったが、tmux 連携で `tig status` を別ペイン起動する導線は未定義だった
- 修正内容
  - `initvims/plugins_config.vim` に `OpenTigStatusInTmuxPane()` を追加し、tmux 外では `tmux, tig が必要`、tmux 内かつ `tig` 未導入時は `tig が必要` を表示するようにした
  - `<leader>gt` を追加し、tmux 内では `tmux split-window -v 'tig status'` 相当で Neovim 下側に新規ペインを開くようにした
- 検証結果
  - `nvim --headless -i NONE '+source ~/.config/nvim/init.vim' '+verbose nmap <leader>gt' '+qall'` で `<leader>gt` が `OpenTigStatusInTmuxPane()` に割り当てられていることを確認
  - `nvim --headless -i NONE '+source ~/.config/nvim/init.vim' '+echo exists("*OpenTigStatusInTmuxPane")' '+qall'` で関数定義の存在を確認

### 2026-04-21: 全角スペースを控えめな下線で可視化する

- 原因
  - 既存の `set list` はタブや EOL の可視化だけで、全角スペース `U+3000` は明示的に識別できなかった
- 修正内容
  - `initvims/basic.vim` に `HighlightZenkakuSpace()` を追加し、全角スペースだけを `cterm=underline gui=underline` と控えめなグレー前景で表示するようにした
  - `Syntax` と `ColorScheme` のたびに再適用する `augroup zenkaku_space` を追加し、配色変更後も表示が消えないようにした
- 検証結果
  - `nvim --headless -i NONE '+source ~/.config/nvim/init.vim' '+verbose highlight ZenkakuSpace' '+qall!'` で `ZenkakuSpace` ハイライトが `initvims/basic.vim` から定義されていることを確認
  - `nvim --headless -i NONE '+source ~/.config/nvim/init.vim' '+call setline(1, "a　b")' '+echo synIDattr(synID(1, 2, 1), "name")' '+qall!'` で全角スペース位置に `ZenkakuSpace` が適用されることを確認
