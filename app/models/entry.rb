class Entry < ApplicationRecord
    enum feeling: [ :happy, :sad, :neutral, :excited, :anxious, :worried, :ecstatic ]
    belongs_to :user, class_name: "User", foreign_key: "user_id"
end
