require 'csv'

module Campaigns
  class ExportCsv
    HEADERS = ['name', 'amount', 'referrals', 'promoters', 'last referral', 'last promoter'].freeze

    class << self
      def call(campaigns)
        CSV.generate(headers: true) do |csv|
          csv << HEADERS
          campaigns.each do
            csv << [_1.name, _1.amount, 10, 11, '21.05.2021', '22.01.2022']
          end
        end
      end
    end
  end
end
