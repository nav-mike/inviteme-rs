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
  validates :personal_api_token, presence: true, uniqueness: true, length: { is: 32 }
  validates :avatar, content_type: %i[png jpg jpeg]

  before_save :generate_personal_token
  after_create :assign_default_role

  after_save_commit if: :email_or_names_changed? do
    broadcast_replace_to ActionView::RecordIdentifier.dom_id(self, 'header_user_full_name'),
                         partial: 'panel/users/full_name',
                         locals: { user: UserDecorator.decorate(self) }
  end

  has_many :campaigns, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [128, 128]
    attachable.variant :micro, resize_to_limit: [20, 20]
    attachable.variant :medium, resize_to_limit: [256, 256]
  end

  def assign_default_role
    add_role(:user)
  end

  def require_password?
    new_record? || !password.nil? || !password_confirmation.nil?
  end

  def email_or_names_changed?
    email_previously_changed? || first_name_previously_changed? || last_name_previously_changed?
  end

  def generate_personal_token
    return if personal_api_token.present?

    loop do
      personal_api_token = SecureRandom.hex(16)
      break if User.where(personal_api_token: personal_api_token).empty?
    end
  end

  def update_avatar_turbo(avatar)
    broadcast_replace_to ActionView::RecordIdentifier.dom_id(self, 'header_user_avatar'),
                         target: ActionView::RecordIdentifier.dom_id(self, 'header_user_avatar'),
                         partial: 'shared/panel/user_avatar',
                         locals: { user: UserDecorator.decorate(self), avatar: avatar }
  end
end
