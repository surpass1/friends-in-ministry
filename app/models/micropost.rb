class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
  
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
 
end
