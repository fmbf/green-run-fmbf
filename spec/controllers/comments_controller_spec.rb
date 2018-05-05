require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:jack_bruce) { User.create!(username: 'jack_bruce', password: 'abcdef') }
  let(:bumblewood_brews) { Brewery.create!(name: 'Bumblewood Brews') }

  let(:beer) do
    Beer.create!(name: jack_bruce, brewery_id: bumblewood_brews.id)
  end

  let(:comment) do
    Comment.create!(body: 'omg delicious', user_id: jack_bruce.id, beer_id: beer.id)
  end

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe 'POST #create' do
    # NOTE: for post requests, the beer_id should be sent in the url, like so:
    # '/beers/:beer_id/comments'
    it { should route(:post, '/beers/1/comments').to(action: :create, beer_id: 1) }

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        post :create, params: { beer_id: beer.id, comment: { body: 'cool' } }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      context 'with invalid params' do
        it 'flashes errors' do
          post :create, params: { beer_id: beer.id, comment: { body: nil } }
          expect(flash[:errors]).to be_present
        end
      end

      context 'with valid params' do
        it 'redirects to the beer show page' do
          post :create, params: { beer_id: beer.id, comment: { body: 'a comment' } }
          expect(response).to redirect_to(beer_url(beer))
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        delete :destroy, params: { id: comment.id }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      it 'removes the comment and redirects back to the beer' do
        delete :destroy, params: { id: comment.id }
        expect(response).to redirect_to(beer_url(beer))
        expect(Comment.exists?(comment.id)).to be false
      end
    end
  end
end
