require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  
  describe '投稿内容の登録' do
    context '投稿ができるとき' do
      it '全ての入力事項が存在すれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    
    context '投稿ができないとき' do
      it 'userが紐づいていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
      it '1枚画像がないと投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it '名物名が空欄だと投稿できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'メッセージが空欄だと投稿できない' do
        @post.message = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Message can't be blank")
      end
    end
  end
end