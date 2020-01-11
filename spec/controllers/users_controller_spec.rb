require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    context 'log in' do
      before do
        login user
      end
      it "詳細ページを表示する" do
        get :show, params: {id: user.id}
        expect(response).to render_template :show
      end
    end

    context 'not log in' do
      it 'ログインしていない場合、トップページにリダイレクトされる' do
        get :show, params: {id: user.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end