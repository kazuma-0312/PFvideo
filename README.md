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