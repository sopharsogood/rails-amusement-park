class Attraction < ApplicationRecord
    # t.string "name"
    # t.integer "tickets"
    # t.integer "nausea_rating"
    # t.integer "happiness_rating"
    # t.integer "min_height"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

    has_many :rides
    has_many :users, through: :rides
end
