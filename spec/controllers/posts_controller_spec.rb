require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      user = create(:user)
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'GET #edit' do
    it "assigns the requested tweet to @post" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      posts = create_list(:post, 3) 
      get :index
    end

    it "renders the :index template" do
    end 
  end

end