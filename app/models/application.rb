class Application < ActiveRecord::Base
  has_many :devices
  # validates :token, presence: false, on: :create
  before_create :generate_remember_token
  # validate :lock_remember_token

  private
    def generate_remember_token
      self.token = RememberToken.new_remember_token
      self.locked = true
    end

    # def lock_remember_token
    #   return unless locked?

    #   message = "cannot change token"
    #   errors.add(:token, message) if token_changed?
    # end
end
