class RememberToken

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
end