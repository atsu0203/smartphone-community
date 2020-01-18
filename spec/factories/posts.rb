FactoryBot.define do

  factory :post, class: Post do
    name               {"smartphone"}
    text               {"iPhone is good smartphone."}
    image              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    user
    category
  end
end