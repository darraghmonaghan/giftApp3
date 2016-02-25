class Group < ActiveRecord::Base

	has_many :memberships
	has_many :users, :through => :memberships
	has_many :invites
	has_many :gifts
	has_many :posts
	has_one :user

end
