require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }

  scenario 'post article', js: true do
    # ログイン前には投稿ボタンがない
    visit root_path
    expect(page).to have_no_content('投稿する')
    
    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    find('#menu_hover_down').hover
    click_link('投稿する')
    expect(page).to have_content('投稿する')

    # 記事の投稿
    expect {
      visit current_path
      expect(current_path).to eq new_post_path
      fill_in 'name', with: 'フィーチャスペックテスト'
      select 'iPhone', from: 'parent_category'
      select 'iPhone X', from: 'child_category'
      attach_file "post_img", "#{Rails.root}/spec/fixtures/test.png"
      fill_in 'text', with: 'フィーチャスペックのテストをしています'
      find('input[type="submit"]').click
    }.to change(Post, :count).by(1)
  end

end