require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe "お買い物リスト新規登録（在庫にないもの）" do
    context "新規登録できるとき" do
      it "category, priority, memo, imageを正しく入力すれば登録できる" do
        expect(@purchase).to be_valid
      end

      it "memoが空でも、category, priority, imageがあれば登録できる" do
        @purchase.memo = ""
        expect(@purchase).to be_valid
      end

      it "imageが空でも、category, priority, memoがあれば登録できる" do
        @purchase.image = nil
        expect(@purchase).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "categoryが空では登録できない" do
        @purchase.category_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Category is not a number")
      end

      it "categoryが1~9以外（10以上）では登録できない" do
        @purchase.category_id = Faker::Number.number(digits: 2)
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Category must be less than or equal to 9")
      end

      it "categoryが1~9以外（0）では登録できない" do
        @purchase.category_id = "0"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Category must be greater than or equal to 1")
      end

      it "categoryが整数値以外では登録できない" do
        @purchase.category_id = Faker::Number.decimal(l_digits: 1)
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Category must be an integer")
      end

      it "priorityが空では登録できない" do
        @purchase.priority_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Priority is not a number")
      end

      it "priorityが1~4以外（5以上）では登録できない" do
        @purchase.priority_id = "5"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Priority must be less than or equal to 4")
      end

      it "priorityが1~4以外（0）では登録できない" do
        @purchase.priority_id = "0"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Priority must be greater than or equal to 1")
      end

      it "priorityが整数値以外では登録できない" do
        @purchase.priority_id = Faker::Number.decimal(l_digits: 1)
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Priority must be an integer")
      end

      it "groupが紐づいていなければ登録できない" do
        @purchase.group = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Group must exist")
      end

      it "memoとimageが両方空では登録できない" do
        @purchase.memo = ""
        @purchase.image = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Memo can't be blank")
      end

    end
  end
end
