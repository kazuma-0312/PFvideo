# PFvideo
### YouTubeが見えるYouTube投稿アプリケーション

[![Image from Gyazo](https://gyazo.com/d78251752c719cf18a7bfaf5ef964dc9)]
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