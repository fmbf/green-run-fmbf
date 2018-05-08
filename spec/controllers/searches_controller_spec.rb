require 'rails_helper'

RSpec.describe SearchesController, type: :controller do

  describe "GET #index" do
    let(:preciosa_lager) { Beer.create!(name: 'Preciosa Lager', brewery_id: 1) }

    # it "returns http success" do
    #   get :index
    #   # expect(response).to have_http_status(:success)
    #   # expect(response).to render_template('index')
    # end
  end

end
