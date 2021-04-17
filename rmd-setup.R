# RStudio の設定
# 1.4.1103 は Windows 版では Python 使用時にエラー
# もし使いたいなら新しいバージョンが出るまで待つか,
# 以下の daily build のどれかをインストールする
# https://dailies.rstudio.com/rstudio/oss/windows/

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
install.packages("ragg")
# ragg のインストール時, Mac/Linux では追加で外部ライブラリのインストールが要求されることがあります.
# その際は手動でインストールしてください
#
# 例えば Ubuntu なら
# apt install libharfbuzz-dev libfribidi-dev
#
# Mac なら
# brew install harfbuzz fribidi

# Python 使いたい人のみ
install.package("reticulate")
# Julia 使いたい人のみ
install.package("JuliaCall")

# このセッション時点では最新版は v0.4.5 です
remotes::install_github('Gedevan-Aleksizde/rmdja', upgrade = "never")
# ragg が使えない/Linux 以外で PDF 形式の画像にしたい場合は以下を試してください.
remotes::install_github("Gedevan-Aleksizde/fontregisterer", upgrade = "never")

# ここはすでにインストールしている人, pdf がいらない人は不要
# それなりに時間がかかるのでセッション中にやらないほうがいいです
tinytex::install_tinytex()
tinytex::tlmgr_install("texlive-msg-translations")

# Linux では Noto フォントもあるといい
# apt install fonts-noto-cjk fonts-noto-cjk-extra


# ---- ここで念の為 RStudio 再起動 ----

# PDF の閲覧は okular が便利です. MS Store で入手できます
# https://www.microsoft.com/ja-jp/p/okular/9n41msq1wnm8?rtc=1&activetab=pivot:overviewtab
#
# Sumatra は軽量ですが, フォントの埋め込みを確認できません.


# ----- 以下は今回あまり取り上げませんが, 便利な拡張パッケージです
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
