require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe "グループ新規作成" do
    context "新規作成できるとき" do
      it "nameを正しく入力すれば登録できる" do
        expect(@group).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nameが空では登録できない" do
        @group.name = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
