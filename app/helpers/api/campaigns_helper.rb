module Api
  module CampaignsHelper
    HREFS = { 'pending' => { url: '/approve', label: 'Approve' },
              'rejected' => { url: '/approve', label: 'Approve' },
              'approved' => { url: '/pay', label: 'Pay' },
              'payed' => { url: '/info', label: 'Show info' } }.freeze

    def button_label_by_status(status)
      button_hash_by_status(status)[:label]
    end

    def button_url_by_status(status)
      button_hash_by_status(status)[:url]
    end

    def button_hash_by_status(status)
      raise ArgumentError.new('Invalid status') unless HREFS.key?(status.to_s)

      HREFS[status.to_s]
    end
  end
end
