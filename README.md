# README

[Kaigi on Rails](https://kaigionrails.org/2021/)の発表説明のためにつくったでもアプリケーションです。

くわしくは以下ポスト参照。

[Kaigi on Rails 2021 で『before\_actionとのつらくならない付き合い方』という内容で登壇してきました。 \- コード日進月歩](https://shinkufencer.hateblo.jp/entry/2021/10/26/015645)

# 動かし方

## GitHubの認証情報を設定する

OAuthのアクセストークンを取得します。取得方法はGitHubのヘルプ参照のこと

[OAuth トークンを使用した Git の自動化 \- GitHub Docs](https://docs.github.com/ja/github/extending-github/git-automation-with-oauth-tokens)

取得をしたら `.env` をRailsアプリケーションルートに配置します。その中に以下の情報を記述します。
```
GITHUB_CLIENT_ID=取得したID
GITHUB_CLIENT_SECRET=取得したシークレット
```


## 事前準備

以下コマンドを実行します

```
bundle install
bin/rails db:migrate
```


## サーバー立ち上げ

```
bin/rails s
```

上記サーバーが立ち上がります。
