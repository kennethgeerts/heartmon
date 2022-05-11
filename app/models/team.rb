class Team < ApplicationRecord
  belongs_to :game

  before_create do
    self.code ||= SecureRandom.base36(6).upcase
  end
end
