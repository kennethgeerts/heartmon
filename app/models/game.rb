class Game < ApplicationRecord
  has_many :teams, dependent: :destroy

  after_create :schedule_data_collection

  def running?
    Time.current.between?(start_at, stop_at)
  end

  def future?
    start_at.future?
  end

  def ended?
    stop_at.past?
  end

  private

  def schedule_data_collection
    if future?
      DataCollectionJob.set(wait_until: start_at).perform_later(self)
    elsif running? # for testing
      DataCollectionJob.perform_later(self)
    end
  end
end
