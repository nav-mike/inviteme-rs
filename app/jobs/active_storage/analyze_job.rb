module ActiveStorage
  class AnalyzeJob < ActiveStorage::BaseJob
    queue_as { ActiveStorage.queues[:analysis] }

    discard_on ActiveRecord::RecordNotFound
    retry_on ActiveStorage::IntegrityError, attempts: 10, wait: :exponentially_longer

    def perform(blob)
      blob.analyze
      blob.attachments.includes(:record).each do |attachment|
        attachment.record_type == User.to_s && attachment.record.update_avatar_turbo(Rails.application.routes.url_helpers.rails_blob_url(blob))
      end
    end
  end
end
