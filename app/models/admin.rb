class Admin < Human
  enum admin_role: [:administrator, :chef, :waiter, :receptionist]

  after_initialize :set_default_admin_role, if: :new_record?
  before_save :downcase_email

  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  has_secure_password

  private
  def downcase_email
    self.email = email.downcase
  end

  def set_default_admin_role
    self.admin_role ||= :administrator
  end
end
