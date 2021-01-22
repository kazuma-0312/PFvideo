# PFvideo
### YouTubeが見えるYouTube投稿アプリケーション

![](https://i.gyazo.com/d78251752c719cf18a7bfaf5ef964dc9.png)

# 概要

### シンプルなYouTube動画投稿アプリ
### 簡単な投稿内容などが確認できてシンプル

自分の好きなYouTubeを投稿できる
投稿内容に説明などができて
コメントやいいねでコミニケーションができる

# App URL
### **https://pfvideo.herokuapp.com/**

# 利用方法

####  トップページから新規登録・ログイン
####  一覧画面へ遷移する
####  新規投稿は真ん中New Tweetをクリック
####  投稿完了後は一覧画面へ戻る<br>
![](https://i.gyazo.com/b4bd13fb4f2082b19043f351e2dfea0d.gif)
![](https://i.gyazo.com/60923c509856a5ca9c7bd44ea46317aa.gif)
<br>

#### 一覧画面から１つの投稿のタイトルを選択 → 投稿詳細画面へ遷移する
#### 投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる<br>
![](https://i.gyazo.com/530b0d2c99307556cd180dbac33d8353.gif)
<br>

#### 投稿詳細画面からコメントができる
![](https://i.gyazo.com/e2a6f87ab82200df2b1d6f2ef0c2289e.gif)

# 機能一覧
| 機能           | 概要             |
| -------------- | -----------------|
| ユーザー管理機能 | 新規登録・ログイン・ログアウトが可能  |
| 投稿機能 | タイトル、YouTUbe_url、テキストで投稿が可能 |
| 投稿詳細表示機能 | 各投稿詳細が詳細ページで閲覧可能 |
| 投稿編集・削除機能 | 投稿者本人のみ投稿編集・削除が可能 |
| ユーザー詳細表示機能 | 各ユーザーのプロフィール・投稿一覧が閲覧可能 |
| LIKE機能 | 各投稿へLIKEをつけることが可能、LIKE削除も可能 |
| コメント機能 | 投稿詳細ページから非同期通信でコメントが可能|

## LIKE機能

| 特徴            | 概要             |
| -------------- | -----------------|
| LIKEした数を表示 | 投稿にいくついいねがあるかカウントするため|

## コメント機能
| 特徴            | 概要             |
| -------------- | ---------------- |
| 非同期通信活用 | 通信量の削減が可能となり、パフォーマンスの向上 |
| ユーザー名の表示とリンク | コメントしたユーザー情報がわかることで、交流にもつなげていける仕様とする為 |

# ローカルでの動作方法

$ git clone https://github.com/kazuma-0312/PFvideo.git
</br>
$ cd PFvideo
</br>
$ bundle install
</br>
$ rails db:create
</br>
$ rails db:migrate
</br>
$ rails s
</br>
 http://localhost:3000


#  開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.3.4
- mysql 8.0.22
- JavaScript
- gem 3.0.3
- heroku 7.47.7 


## usersテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| nickname      | string         | nul:  false              |
| email         | string         | null: false              |
| password      | string         | null: false              |

### Association
- has_many :tweets
- has_many :comments
- has_many :likes

## tweetsテーブル

| Column        | Type            | Options                  |
| ------------- | --------------- | ------------------------ |
| youtube_url   | string          | nul:  false              |
| text          | text            | null: false              |
| title         | string          | null: false              |
| user          | references      | foreign_key: true        |

### Association
- has_many :users
- has_many :likes
- has_many :comments


## commentsテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| text          | text           | null: false              |
| user_id       | references     | foreign_key: true        |
| tweet_id      | references     | foreign_key: true        |


### Association
  - belongs_to :user
  - belongs_to :tweet

## likesテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| user_id       | references     | foreign_key: true        |
| tweet_id      | references     | foreign_key: true        |

### Association
  - belongs_to :user
  - belongs_to :tweet