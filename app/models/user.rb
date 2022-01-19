class User < ApplicationRecord
  rolify strict: true
  acts_as_authentic { _1.crypto_provider = ::Authlogic::CryptoProviders::SCrypt }

  validates :email, format: { with: /@/, message: 'should look like an email address.' },
                    length: { maximum: 100 },
                    uniqueness: { case_sensitive: false, if: :will_save_change_to_email? }
  validates :password, confirmation: { if: :require_password? },
                       length: { minimum: 8, if: :require_password? }
  validates :password_confirmation, length: { minimum: 8, if: :require_password? }

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user)
  end
end
