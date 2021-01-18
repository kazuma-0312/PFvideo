require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'Urlとタイトルとテキストがあれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end
      it 'youtube_urlが空では投稿できない' do
        @tweet.youtube_url = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Youtube url can't be blank")
      end
      it 'テキストが空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
