require 'rails_helper'

RSpec.describe BreweriesController, type: :controller do
  let(:jack) { User.create!(username: 'jack_bruce', password: 'abcdef') }

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "GET #index" do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it 'renders the breweries index page' do
        get :index
        expect(response).to have_http_status(:success)
        expect(response).to render_template('index')
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end

  end

  describe "GET #new" do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it 'renders the new brewery page' do
        get :new
        expect(response).to have_http_status(:success)
        expect(response).to render_template('new')
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe 'POST #create' do
    let(:jack_bruce) { User.create!(username: 'jack_bruce', password: 'abcdef') }
    let(:bumblewood_brews) { Brewery.create!(name: 'Bumblewood Brews') }

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        post :create, params: { brewery: {} }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      context 'with invalid params' do
        it 'validates the presence of name' do
          post :create, params: { brewery: { name: nil } }
          expect(response).to render_template('new')
          expect(flash[:errors]).to be_present
        end
      end

      context 'with valid params' do
        it 'redirects to the breweries index page' do
          post :create, params: { brewery: { name: "Valid Brews" } }
          expect(response).to render_template('index')
        end
      end
    end
  end


end
