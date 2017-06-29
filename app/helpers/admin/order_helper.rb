module Admin::OrderHelper
  def find_discount param
    if param
      discount = DiscountCode.find_by code: param
      if discount
        discount
      else
        true
      end
    end
  end
end
