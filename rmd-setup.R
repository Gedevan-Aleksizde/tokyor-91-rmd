##### (1) RStudio のバージョンについて ####
# 1.4.1103 は Windows 版では Python 使用時にエラーが発生します
# もし Python を使いたいなら新しいバージョンが出るまで待つか,
# 以下の daily build のどれかをインストールしてください
# https://dailies.rstudio.com/rstudio/oss/windows/

##### (2) パッケージのインストール ####
# インストール済みであっても最新版にしておいてください
# ダイアログボックスでなにか言われたらNO!
install.packages(
  c("tidyverse",
    "remotes",
    "rmarkdown",
    "bookdown",
    "officedown",
    "citr",
    "ymlthis",
    "svglite",
    "kableExtra"
  )
)

##### (3) ragg インストール ####
install.packages("ragg")
# ragg のインストール時, Mac/Linux では追加で外部ライブラリのインストールが要求されることがあります.
# その際は手動でインストールしてください. おそらくは以下のような操作になります.
#
# 例えば Ubuntu なら
# sudo apt install libharfbuzz-dev libfribidi-dev
#
# Mac なら homebrew でインストールします
# brew install harfbuzz fribidi

##### (4) PDF 画像の準備 ####
# さらに PDF で画像を出力したい場合は, X11 と Cairo が必要です.
# Windows の場合, 以下が TRUE になっていることを確認してください
capabilities()[c("cairo")]
# Mac や Linux の場合は, 両方が TRUE になっていることを確認してください.
capabilities()[c("X11", "cairo")]

# Windows や多くの Linux 系はあまり気にしなくても良いですが,
# 最近の Mac はデフォルトで必要なプログラムが入っていないようです.
# Mac は以下の2つをインストールすれば使えます (インストールには homebrew が必要です).
# ただし, xquartz のほうはうまく行かない例が報告されています.
# https://www.xquartz.org/ で dmg ファイルをダウンロードしてインストールすることも試してください.
#
# brew install cairo
# brew cask install xquartz

##### (5) rmdja パッケージのインストール ####
# PDF は設定が複雑なので, 私の作成した rmdja パッケージを使うことをお薦めします.
# このセッション時点では最新版は v0.4.5 です
remotes::install_github('Gedevan-Aleksizde/rmdja', upgrade = "never")

##### (6) TeX のインストールします ####
# これはすでにインストールしている人, PDF 文書の作成を目的としていない人は不要です
# それなりに時間がかかるので注意してください
tinytex::install_tinytex()
tinytex::tlmgr_install("texlive-msg-translations")

##### (7) 共通フォントのインストール (Linux のみ) ####
# 以降の説明を簡単にするため, Linux でのフォントを共通化します.
# これは Linux 系 OS をお使いの方のみ必要です.
# Linux 系 OS をお使いならば, Noto フォントをおすすめします.
# 例えば Ubuntu (RStudio Cloud も Ubuntu OS です) ならば以下でインストールできます
# sudo apt install fonts-noto-cjk fonts-noto-cjk-extra


# ---- ここで念の為 RStudio 再起動 ----

# PDF の閲覧は okular が便利です. MS Store で入手できます
# https://www.microsoft.com/ja-jp/p/okular/9n41msq1wnm8?rtc=1&activetab=pivot:overviewtab
#
# Sumatra は軽量ですが, フォントの埋め込みを確認できません.


# ----- 以下は基本チュートリアルの範囲ではあまり取り上げませんが, 便利な拡張パッケージです

# Python 使いたい人へ
install.package("reticulate")

# Julia 使いたい人へ
install.package("JuliaCall")

# ragg が使えない/Linux 以外で PDF 形式の画像で文字化けを防ぎたい場合は以下を試してください.
remotes::install_github("Gedevan-Aleksizde/fontregisterer", upgrade = "never")

install.packages(c(
  "xaringan",
  "bookdownplus",
  "blogdown",
  "pagedown"
  ))

# "word" 関連
install.packages(
  c("officer", "rvg", "openxlsx",
    "ggplot2", "flextable", "xtable", "rgl", "stargazer",
    "tikzDevice", "xml2", "broom")
)
# パワーポイントやWordにグラフをエクスポートする
remotes::install_github("tomwenseleers/export")
# Word の更新差分を考慮して編集できる (ただし現在開発停止中)
remotes::install_github("noamross/redoc")
