# README

## usersテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| nickname      | string         | nul:  false              |
| email         | string         | null: false              |
| password      | string         | null: false              |

### Association
- has_many :tweets
- has_many :rooms
- has_many :entries
- has_many :comments

## tweetsテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| video        | string          | nul:  false              |
| text         | text            | null: false              |
| user         | references      | foreign_key: true        |

### Association
- has_many :tags, through: :tweet_tag_relations
- has_many :tweet_tag_relations
- has_many :tweets

## tagsテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| name          | string         | nul:  false              |

### Association
 has_many :tweet_tag_relations
 has_many :tweets, through: :tweet_tag_relations

## tweet_tag_relationsテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| tweet_id      | references     | foreign_key: true        |
| tag_id        | references     | foreign_key: true        |

### Association
- belongs_to :tweet
- belongs_to :tag

## commentsテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| text          | text           | null: false              |
| user_id       | references     | foreign_key: true        |
| tweet_id      | references     | foreign_key: true        |

### Association
- has_many :user

## messagesテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| message       | text           | null: false              |
| user_id       | references     | foreign_key: true        |
| room_id       | references     | foreign_key: true        |

### Association

- belongs_to :user
- belongs_to :room

### roomsテーブル

### Association

    has_many :messages
    has_many :entries
    has_many :users, through: :entries

## entriesテーブル

| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| user_id       | references     | foreign_key: true        |
| room_id       | references     | foreign_key: true        |

### Association
- belongs_to :user
- belongs_to :room

## commentsテーブル
| Column        | Type           | Options                  |
| ------------- | -------------- | ------------------------ |
| message       | text           | null: false              |
| user_id       | references     | foreign_key: true        |
| room_id       | references     | foreign_key: true        |

- has_many :tweets
- has_many :users