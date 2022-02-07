# User model for auth process
class User < ApplicationRecord
  rolify strict: true
  acts_as_authentic { _1.crypto_provider = ::Authlogic::CryptoProviders::SCrypt }
  acts_as_paranoid

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                              message: 'should look like an email address.' },
                    length: { maximum: 100 },
                    uniqueness: { case_sensitive: false, if: :will_save_change_to_email? }
  validates :password, confirmation: { if: :require_password? },
                       length: { minimum: 8, if: :require_password? }
  validates :password_confirmation, length: { minimum: 8, if: :require_password? }

  after_create :assign_default_role

  after_save_commit if: :email_or_names_changed? do
    broadcast_replace_to ActionView::RecordIdentifier.dom_id(self, 'header_user_full_name'),
                         partial: 'panel/users/full_name',
                         locals: { user: UserDecorator.decorate(self) }
  end

  has_many :campaigns, dependent: :destroy

  def assign_default_role
    add_role(:user)
  end

  def require_password?
    new_record? || !password.nil? || !password_confirmation.nil?
  end

  def email_or_names_changed?
    email_previously_changed? || first_name_previously_changed? || last_name_previously_changed?
  end
end
