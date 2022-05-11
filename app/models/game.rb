class Game < ApplicationRecord
  has_many :teams

  def in_progress?
    Time.now.between?(start_at, stop_at)
  end
end
