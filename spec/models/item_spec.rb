require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "在庫新規登録" do
    context "新規登録できるとき" do
      it "category, memo, imageを正しく入力すれば登録できる" do
        expect(@item).to be_valid
      end

      it "memoが空でも、category, imageがあれば登録できる" do
        @item.memo = ""
        expect(@item).to be_valid
      end

      it "imageが空でも、category, memoがあれば登録できる" do
        @item.image = nil
        expect(@item).to be_valid
      end

    end

    context "新規登録できないとき" do
      it "categoryが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "categoryが1~9以外（10以上）では登録できない" do
        @item.category_id = Faker::Number.number(digits: 2)
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be less than or equal to 9")
      end

      it "categoryが1~9以外（0）では登録できない" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be greater than or equal to 1")
      end

      it "categoryが整数値以外では登録できない" do
        @item.category_id = Faker::Number.decimal(l_digits: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be an integer")
      end

      it "memoとimageが両方空では登録できない" do
        @item.memo = ""
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Memo can't be blank")
      end

      it "groupが紐づいていなければ登録できない" do
        @item.group = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Group must exist")
      end
    end
  end
end
