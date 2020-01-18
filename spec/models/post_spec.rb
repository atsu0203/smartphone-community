require 'rails_helper'
describe Post do
  describe '#create' do
    # 1.name, text, image, user, categoryが存在すれば投稿できること
    it "is valid with a name, text, image, user,category" do
      post = build(:post)
      expect(post).to be_valid
    end

    # 2. nameが空では投稿できないこと
    it "is invalid without a name" do
      post = build(:post, name: nil)
      post.valid?
      expect(post.errors[:name]).to include("を入力してください")
    end

    # 3. textが空では投稿できないこと
    it "is invalid without a text" do
      post = build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end

    # 4. imageが空では投稿できないこと
    it "is invalid without an image" do
      post = build(:post, image: nil)
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end

     # 5. userが空では投稿できないこと
     it "is invalid without a user" do
      post = build(:post, user: nil)
      post.valid?
      expect(post.errors[:user]).to include("を入力してください")
    end

    # 6. categoryが空では投稿できないこと
    it "is invalid without category" do
      post = build(:post, category: nil)
      post.valid?
      expect(post.errors[:category]).to include("を入力してください")
    end

    # 7. nameが17文字以上であれば登録できないこと
    it "is invalid with a name that has more than 17 characters " do
      post = build(:post, name: "123456789012345678")
      post.valid?
      expect(post.errors[:name]).to include("は16文字以内で入力してください")
    end

    # 8. nameが16文字以下では登録できること
    it "is valid with a nickname that has less than 16 characters " do
      post = build(:post, name: "1234567890123456")
      expect(post).to be_valid
    end
  end
end

