require 'spec_helper'

describe User, :type => :model do

  set!(:user)

  context 'a new user has no friends' do

    it { expect(user.friends.count).to eq(0) }

    context 'with a friend' do

      set!(:friend) { create :user }
      set!(:other_friend) { create :user }

      before(:all) { user.add_friend(friend) }

      it { expect(user.friends.count).to eq(1) }

      it "allows removing the friend" do
        expect { user.remove_friend(friend) }.to_not raise_error
        expect(user.friends.count).to eq(0)
      end

      it "disallows adding the same friend again" do
        expect { user.add_friend(friend) }.to raise_error
        expect(user.friends.count).to eq(1)
      end

      it "allows adding a different friend" do
        expect { user.add_friend(other_friend) }.to_not raise_error
        expect(user.friends.count).to eq(2)
      end

      it { expect(user.friends).to include friend }
      it { expect(user.friends).not_to include other_friend }
    end
  end
end
