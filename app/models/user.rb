class User < ApplicationRecord
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true

  has_many :user_activities

  after_save :notify_user

  scope :archived_users, -> { where(archived: true) }
  scope :unarchived_users, -> { where(archived: false) }

  def mark_archive(current_user: current_user, archived: archived)
  	response = if self == current_user
  		{ error: "Can't archive yourself" }
  	else
  		update(archived: archived)
  		activity = user_activities.create(updater_id: current_user.id, action: :archive)
  		UserMailer.notify_user(activity.id)
  		{ message: "Archived successfully"}
  	end
  	response
  end

  def self.filter(params)
  	users = if params["archived"].nil?
  		User.all
  	elsif params["archived"].to_s == "true"
  		User.archived_users
  	else
  		User.unarchived_users
  	end
  	users
	end
end
