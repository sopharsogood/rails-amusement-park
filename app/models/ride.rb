class Ride < ApplicationRecord
    # t.integer "user_id"
    # t.integer "attraction_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

    belongs_to :user
    belongs_to :attraction

    def take_ride
        reasons_rejected_from_ride = ["Sorry."]
        if self.user.tickets < self.attraction.tickets
            reasons_rejected_from_ride << "You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if self.user.height < self.attraction.min_height
            reasons_rejected_from_ride << "You are not tall enough to ride the #{self.attraction.name}."
        end
        if reasons_rejected_from_ride != ["Sorry."]
            puts reasons_rejected_from_ride
            reasons_rejected_from_ride.join(" ")
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
        end
    end

end
