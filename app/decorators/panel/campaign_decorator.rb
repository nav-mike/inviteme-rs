module Panel
  class CampaignDecorator < ApplicationDecorator
    ReferralStruct = Struct.new(:id, :email, :created_at, :reward_status, :price, :promoter)
    PromoterStruct = Struct.new(:id, :email, :referrals, :created_at, :total_income, :full_name)

    FIRST_NAMES = %w[Mike Jeff John].freeze
    LAST_NAMES = %w[Navrotskii Caplan Snow].freeze
    STATUSES = %w[pending approved payed rejected].freeze

    def referrals_chart_data
      (10.days.ago.to_date..Time.zone.today).to_a.map do |date|
        { date.to_formatted_s(:db) => (0..100).to_a.sample }
      end.reduce({}, :merge)
    end

    def promoters_chart_data
      (10.days.ago.to_date..Time.zone.today).to_a.map do |date|
        { date.to_formatted_s(:db) => (0..200).to_a.sample }
      end.reduce({}, :merge)
    end

    def referrals
      Array.new(25) do |value|
        ReferralStruct.new(
          value + 1,
          "some-#{value}@email.com",
          Time.zone.now,
          STATUSES.sample,
          "$#{rand(10)}.#{rand(99)}",
          "#{FIRST_NAMES.sample} #{LAST_NAMES.sample}"
        )
      end
    end

    def promoters
      Array.new(25) do |value|
        PromoterStruct.new(
          value + 1,
          "some-#{value}@email.com",
          rand(101),
          Time.zone.now,
          "$#{rand(10_000)}",
          "#{FIRST_NAMES.sample} #{LAST_NAMES.sample}"
        )
      end
    end
  end
end
