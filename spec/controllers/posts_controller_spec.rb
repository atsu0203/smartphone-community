require 'rails_helper'

describe PostsController, type: :controller do
  
  describe 'GET #new' do
    it "renders the :new template" do
      user = create(:user)
      sign_in user
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      post = create(:post)
      get :show, params: {  id: post }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "assigns the requested tweet to @post" do
      user = create(:user)
      sign_in user
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "renders the :edit template" do
      user = create(:user)
      sign_in user
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      posts = create_list(:post, 3) 
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end 
  end

end