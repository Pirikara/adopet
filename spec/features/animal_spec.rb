require 'rails_helper'

feature 'animal', type: :feature do
  let(:user) { create(:user) }

  scenario '募集投稿の統合テスト' do
    #ログイン処理
    visit root_path
    find('.sign_in_button').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login__submit').click
    expect(current_path).to eq root_path

    #新規投稿
    expect{
      click_link('里親を募集する')
      expect(current_path).to eq new_animal_path
      find('#animal_images_attributes_0_image').click
      attach_file "animal[images_attributes][0][image]", "app/assets/images/default.png"
      fill_in 'animal[name]', with: 'テスト'
      fill_in 'animal[description]', with: 'テストです'
      select '犬', from: 'animal[category_id]'
      select '北海道', from: 'animal[prefecture_id]'
      select '男の子', from: 'animal[gender_id]'
      find('.animal-new__submit').click
    }.to change(Animal, :count).by(1)
  end

  scenario '投稿編集の統合テスト' do
    #ログイン処理
    visit root_path
    find('.sign_in_button').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login__submit').click
    expect(current_path).to eq root_path
    
    #新規投稿
    click_link('里親を募集する')
    expect(current_path).to eq new_animal_path
    find('#animal_images_attributes_0_image').click
    attach_file "animal[images_attributes][0][image]", "app/assets/images/default.png"
    fill_in 'animal[name]', with: 'テスト'
    fill_in 'animal[description]', with: 'テストです'
    select '犬', from: 'animal[category_id]'
    select '北海道', from: 'animal[prefecture_id]'
    select '男の子', from: 'animal[gender_id]'
    find('.animal-new__submit').click
    expect(current_path).to eq animals_path
    expect(page).to have_content('テスト')
    
    #投稿編集
    find('.animal-show__link').click
    find('.giver__buttons--edit').click
    fill_in 'animal[name]', with: 'テスト2'
    find('.animal-edit__submit').click
    expect(page).to have_content('テスト2')

    #投稿削除
    expect{
      find('.giver__buttons--delete').click
      expect(current_path).to eq animals_path
      expect(page).to have_no_content('テスト2')
    }.to change(Animal, :count).by(-1)
  end
end