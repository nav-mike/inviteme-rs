require 'csv'

module Referrals
  class ExportCsv
    HEADERS = ['email', 'created at', 'reward status', 'price', 'promoter'].freeze

    class << self
      def call(_campaign)
        CSV.generate(headers: true) do
          _1 << HEADERS
        end
      end
    end
  end
end
