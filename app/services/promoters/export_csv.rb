require 'csv'

module Promoters
  class ExportCsv
    HEADERS = ['email', 'full name', 'total income', 'referrals', 'created at'].freeze

    class << self
      def call(_campaign)
        CSV.generate(headers: true) do |csv|
          csv << HEADERS
        end
      end
    end
  end
end
