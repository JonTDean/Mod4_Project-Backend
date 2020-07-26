class UserPlayer < ApplicationRecord
    belongs_to :users
    belongs_to :players
end
