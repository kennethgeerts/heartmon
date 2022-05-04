class Team < ApplicationRecord
  belongs_to :game

  before_create do
    code = SecureRandom.base36(6).upcase
  end
end
