require "rails_helper"

describe TablesController do
  before :each do
    @request.host = "localhost:3000"
  end

  describe "GET #index" do
    it "Table index" do
      get :index
      expect(response).to render_template :index
    end
  end
end
