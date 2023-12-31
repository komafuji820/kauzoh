require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe "お買い物リスト新規登録（在庫リストから）" do
    context "新規登録できるとき" do
      it "category, priority, memoを正しく入力すれば登録できる" do
        expect(@order).to be_valid
      end

      it "memoが空でも、category, priorityがあれば登録できる" do
        @order.memo = ""
        expect(@order).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "categoryが空では登録できない" do
        @order.category_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Category is not a number")
      end

      it "categoryが1~9以外（10以上）では登録できない" do
        @order.category_id = Faker::Number.number(digits: 2)
        @order.valid?
        expect(@order.errors.full_messages).to include("Category must be less than or equal to 9")
      end

      it "categoryが1~9以外（0）では登録できない" do
        @order.category_id = "0"
        @order.valid?
        expect(@order.errors.full_messages).to include("Category must be greater than or equal to 1")
      end

      it "categoryが整数値以外では登録できない" do
        @order.category_id = Faker::Number.decimal(l_digits: 1)
        @order.valid?
        expect(@order.errors.full_messages).to include("Category must be an integer")
      end

      it "priorityが空では登録できない" do
        @order.priority_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Priority is not a number")
      end

      it "priorityが1~4以外（5以上）では登録できない" do
        @order.priority_id = "5"
        @order.valid?
        expect(@order.errors.full_messages).to include("Priority must be less than or equal to 4")
      end

      it "priorityが1~4以外（0）では登録できない" do
        @order.priority_id = "0"
        @order.valid?
        expect(@order.errors.full_messages).to include("Priority must be greater than or equal to 1")
      end

      it "priorityが整数値以外では登録できない" do
        @order.priority_id = Faker::Number.decimal(l_digits: 1)
        @order.valid?
        expect(@order.errors.full_messages).to include("Priority must be an integer")
      end

      it "groupが紐づいていなければ登録できない" do
        @order.group = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Group must exist")
      end

      it "itemが紐づいていなければ登録できない" do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end

    end
  end
end