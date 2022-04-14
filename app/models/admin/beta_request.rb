module Admin
  class BetaRequest < ApplicationRecord
    attr_accessor :full_name, :email, :company, :status

    enum status: { pending: 0, approved: 1, rejected: 2 }
  end
end
