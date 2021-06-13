require 'rails_helper'

RSpec.describe Following, type: :model do
  let(:user1) do
    User.create(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                password_confirmation: 'password')
  end
  let(:user2) do
    User.create(username: 'Juliana 2', fullname: 'Juliana 2', email: 'test2@test.com', password: 'password',
                password_confirmation: 'password')
  end

  context 'validations' do
    it 'fails when follower_id not present' do
      expect(Following.new(followed_id: user1.id).valid?).to be false
    end

    it 'fails when followed_id not present' do
      expect(Following.new(follower_id: user1.id).valid?).to be false
    end

    it 'validates when both follower_id and followed_id are present' do
      expect(Following.new(follower_id: user1.id, followed_id: user2.id).valid?).to be true
    end
  end

  context 'associations' do
    it 'creates mutual follower - following relationship' do
      Following.create(follower_id: user1.id, followed_id: user2.id)
      expect(user1.following.all.map { |user| user.id }).to include user2.id
      expect(user2.followers.all.map { |user| user.id }).to include user1.id
    end
  end
end
