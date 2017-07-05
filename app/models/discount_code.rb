class DiscountCode < ApplicationRecord
  include Encode
  after_save :generate_code
end
