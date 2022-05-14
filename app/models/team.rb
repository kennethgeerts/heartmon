class Team < ApplicationRecord
  belongs_to :game
  has_many :heart_rates

  before_create :set_code

  scope :by_current_heart_rate, -> { order(rate: 'asc') }
  scope :by_average_heart_rate, -> { order(rate_avg: 'asc') }

  def live?
    rate.present? && measured_at > 15.seconds.ago
  end

  def add_heart_rate(heart_rate, measured_at)
    self.rate = heart_rate
    self.measured_at = measured_at
    self.rate_min = [self.rate_min || rate, rate].min
    self.rate_max = [self.rate_max || rate, rate].max
    self.rate_sum += heart_rate
    self.rate_count += 1
    save!

    if heart_rates.none? || measured_at - heart_rates.last.measured_at > 15
      heart_rates.create(rate: heart_rate, measured_at: measured_at)
    end
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
end
