module User::Auth
  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true
    validates :password, presence: true, if: proc { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  def password=(password_string)
    @password = password_string
    self.password_digest = digest(password_string) if password_string.present?
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
