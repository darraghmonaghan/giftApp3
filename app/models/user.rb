class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	has_many :memberships
	has_many :groups, :through => :memberships
	has_many :gifts
	has_many :posts
	has_many :votes

	has_many :invitations, :class_name => 'Invite', :foreign_key => 'recipient_id'
	has_many :sent_invites, :class_name => 'Invite', :foreign_key => 'sender_id'

         
end
