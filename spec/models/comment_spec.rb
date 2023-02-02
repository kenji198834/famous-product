require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  
  describe 'コメントの登録' do
    context 'コメントができるとき' do
      it '全ての入力事項が存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントができないとき' do
      it 'userが紐づいていないとコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it '投稿が紐づいていないとコメントできない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Post must exist')
      end
      it '内容が空欄だとコメントできない' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end