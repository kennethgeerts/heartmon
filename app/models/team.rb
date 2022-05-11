class Team < ApplicationRecord
  belongs_to :game
  has_many :heart_rates

  before_create :set_code
  after_create :schedule_heart_rates_collection

  def live?
    last_heart_rate.time > 10.seconds.ago if last_heart_rate
  end

  def last_heart_rate
    heart_rates.last
  end

  def average_heart_rate
    heart_rates.average(:rate)&.round
  end

  def ws_url
    "wss://dev.pulsoid.net/api/v1/data/real_time?access_token=#{token}"
  end

  def as_json(options = {})
    super(options).merge(ws_url: ws_url)
  end

  private

  def set_code
    self.code ||= SecureRandom.base36(6).upcase
  end

  def schedule_heart_rates_collection
    if game.future?
      DataCollectionJob.set(wait_until: game.start_at).perform_later(self)
    elsif game.running?
      DataCollectionJob.perform_later(self)
    end
  end
end
