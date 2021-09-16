class User < ApplicationRecord
    # t.string "name"
    # t.string "password_digest"
    # t.integer "nausea"
    # t.integer "happiness"
    # t.integer "tickets"
    # t.integer "height"
    # t.boolean "admin", default: false
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.nausea && self.happiness
            if self.nausea > self.happiness
                "sad"
            elsif self.nausea < self.happiness
                "happy"
            else
                "neutral"
            end
        else
            "mood undefined"
        end
    end
end
