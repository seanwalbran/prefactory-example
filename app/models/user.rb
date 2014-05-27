class User < ActiveRecord::Base

  has_many :friendships, :foreign_key => 'initiator_id'
  has_many :friends, :through => :friendships, :source => :acceptor

  def add_friend(other_user)
    friendships.create! { |fs| fs.acceptor = other_user }
  end

  def remove_friend(other_user)
    friendship = friendships.where(:acceptor_id => other_user.id).first
    friendship.destroy!
  end

end
