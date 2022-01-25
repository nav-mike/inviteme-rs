module Panel
  class CampaignDecorator < ApplicationDecorator
    def referrals_chart_data
      (10.days.ago.to_date..Date.today).to_a.map do
        {_1.to_s(:db) => (0..100).to_a.sample}
      end.reduce({}, :merge)
    end

    def promoters_chart_data
      (10.days.ago.to_date..Date.today).to_a.map do
        {_1.to_s(:db) => (0..200).to_a.sample}
      end.reduce({}, :merge)
    end

    def referrals
      25.times.map do
        OpenStruct.new(
          id: _1 + 1,
          email: "some-#{_1}@email.com",
          created_at: Time.zone.now,
          reward_status: %w[pending approved payed rejected].sample,
          price: "$#{rand(10)}.#{rand(99)}",
          promoter: "#{%w[Mike Jeff John].sample} #{%w[Navrotskii Caplan Snow].sample}"
        )
      end
    end

    def promoters
      25.times.map do
        OpenStruct.new(
          id: _1 + 1,
          email: "some-#{_1}@email.com",
          referrals: rand(101),
          created_at: Time.zone.now,
          total_income: "$#{rand(10000)}",
          full_name: "#{%w[Mike Jeff John].sample} #{%w[Navrotskii Caplan Snow].sample}"
        )
      end
    end
  end
end
