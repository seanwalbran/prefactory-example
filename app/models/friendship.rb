class Friendship < ActiveRecord::Base

  belongs_to :initiator, :class_name => "User", :foreign_key => "initiator_id"
  belongs_to :acceptor, :class_name => "User", :foreign_key => "acceptor_id"

  validates :acceptor_id, :presence => true, :uniqueness => { :scope => :initiator_id }

end
