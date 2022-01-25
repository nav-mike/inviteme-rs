module Campaigns
  class ExportCsv
    HEADER = ['name', 'amount', 'referrals', 'promoters', 'last referral', 'last promoter'].freeze

    class << self
      def call(campaigns)
        result = "#{HEADER.join(',')}\n"
        result << campaigns.map do
          "#{[_1.name, _1.amount, 10, 11, '21.05.2021', '22.01.2022'].join(',')}"
        end.join("\n")
        result
      end
    end
  end
end
