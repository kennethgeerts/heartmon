class Game < ApplicationRecord
  has_many :teams

  def running?
    Time.current.between?(start_at, stop_at)
  end

  def future?
    start_at.future?
  end

  def ended?
    stop_at.past?
  end
end
