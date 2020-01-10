require 'rails_helper'
describe Animal do
  describe '#create' do
    it "名前が入力されていなければ登録できない" do
      animal = build(:animal, name: "")
      animal.valid?
      expect(animal.errors[:name]).to include("を入力してください")
    end

    it "名前が7文字以上では登録できない" do
      animal = build(:animal, name: "aaaaaaa")
      animal.valid?
      expect(animal.errors[:name]).to include("は6文字以内で入力してください")
    end

    it "説明が入力されていなければ登録できない" do
      animal = build(:animal, description: "")
      animal.valid?
      expect(animal.errors[:description]).to include("を入力してください")
    end

    it "カテゴリーが入力されていなければ登録できない" do
      animal = build(:animal, category_id: "")
      animal.valid?
      expect(animal.errors[:category_id]).to include("を入力してください")
    end

    it "エリアが入力されていなければ登録できない" do
      animal = build(:animal, prefecture_id: "")
      animal.valid?
      expect(animal.errors[:prefecture_id]).to include("を入力してください")
    end

    it "性別が入力されていなければ登録できない" do
      animal = build(:animal, gender_id: "")
      animal.valid?
      expect(animal.errors[:gender_id]).to include("を入力してください")
    end
  end
end