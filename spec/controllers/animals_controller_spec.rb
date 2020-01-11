require 'rails_helper'

describe AnimalsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
      end
      it "投稿ページを表示する" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      it 'ログインしていない場合、トップページにリダイレクトされる' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #edit' do
    it "edit中の@animalと投稿したanimalが一致する" do
      animal = create(:animal)
      get :edit, params: { id: animal }
      expect(assigns(:animal)).to eq animal
    end

    it "編集ページを表示する" do
      animal = create(:animal)
      get :edit, params: { id: animal }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "一覧ページを表示する" do
      get :index
      expect(response).to render_template :index
    end
  end
end