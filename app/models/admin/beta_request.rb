module Admin
  class BetaRequest < ApplicationRecord
    attr_accessor :full_name, :email, :company, :status

    enum status: { pending: 0, approved: 1, rejected: 2 }

    validates :full_name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: true
    validates :company, presence: true, length: { maximum: 255 }
  end
end
