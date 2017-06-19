require "rails_helper"

RSpec.describe OrdersController, type: :controller do
  describe "POST #create" do
    it "create sucess" do
      expect do
        post :create, params: {code: "IZG6U", day: "2017-06-19",
          time_in: 2, table_id: 5}, format: :js
      end.to change(Order, :count).by 1
    end
  end
end
