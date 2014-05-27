require 'spec_helper'

describe User do

  set!(:user)

  context 'a new user has no friends' do

    it { user.friends.count.should == 0 }

    context 'with a friend' do

      set!(:friend) { create :user }
      set!(:other_friend) { create :user }

      before(:all) { user.add_friend(friend) }

      it { user.friends.count.should == 1 }

      it "allows removing the friend" do
        expect { user.remove_friend(friend) }.to_not raise_error
        user.friends.count.should == 0
      end

      it "disallows adding the same friend again" do
        expect { user.add_friend(friend) }.to raise_error
        user.friends.count.should == 1
      end

      it "allows adding a different friend" do
        expect { user.add_friend(other_friend) }.to_not raise_error
        user.friends.count.should == 2
      end

      it { user.friends.should include friend }
      it { user.friends.should_not include other_friend }
    end
  end
end
