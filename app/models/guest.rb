class Guest < Human
  include Encode
  has_many :orders, dependent: :destroy

  after_save :generate_code
end
