class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :updater, class_name: "User"
end
