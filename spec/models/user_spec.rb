# rubocop:disable Metrics/ClassLength

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'fails when username not present' do
      user = User.new(fullname: 'Juliana', email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be false
    end

    it 'fails when username is too short' do
      user = User.new(username: 'Jul', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be false
    end

    it 'fails when username is too long' do
      user = User.new(username: 'J' * 21, fullname: 'Juliana', email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be false
    end

    it 'fails when fullname not present' do
      user = User.new(username: 'Juliana', email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be false
    end

    it 'fails when username is too short' do
      user = User.new(username: 'Juliana', fullname: 'Julia', email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be false
    end

    it 'fails when username is too long' do
      user = User.new(username: 'Juliana', fullname: 'J' * 81, email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be false
    end

    it 'validates when username and fullname are both provided and are not too short' do
      user = User.new(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                      password_confirmation: 'password')
      expect(user.valid?).to be true
    end
  end

  context 'associations' do
    let(:user1) do
      User.create(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:user2) do
      User.create(username: 'Juliana 2', fullname: 'Juliana 2', email: 'test2@test.com', password: 'password',
                  password_confirmation: 'password')
    end

    it 'can create an opinion' do
      user1.opinions.create(opinion: 'a valid opinion')
      expect(user1.opinions.all.size).to be 1
    end

    it 'creates mutual follower - following relationship' do
      user1.active_followings.create(followed_id: user2.id)
      expect(user1.following.all.map(&:id)).to include user2.id
      expect(user2.followers.all.map(&:id)).to include user1.id
    end
  end

  context 'follow' do
    let(:user1) do
      User.create(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:user2) do
      User.create(username: 'Juliana 2', fullname: 'Juliana 2', email: 'test2@test.com', password: 'password',
                  password_confirmation: 'password')
    end

    it 'creates mutual follower - following relationship' do
      user1.follow(user2)
      expect(user1.following.all.map(&:id)).to include user2.id
      expect(user2.followers.all.map(&:id)).to include user1.id
    end
  end

  context 'unfollow' do
    let(:user1) do
      User.create(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:user2) do
      User.create(username: 'Juliana 2', fullname: 'Juliana 2', email: 'test2@test.com', password: 'password',
                  password_confirmation: 'password')
    end

    it 'destroys following relationship' do
      user1.follow(user2)
      expect(user1.following.all.map(&:id)).to include user2.id
      user1.unfollow(user2)
      expect(user1.following.all.map(&:id)).not_to include user2.id
    end
  end

  context 'following?' do
    let(:user1) do
      User.create(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:user2) do
      User.create(username: 'Juliana 2', fullname: 'Juliana 2', email: 'test2@test.com', password: 'password',
                  password_confirmation: 'password')
    end

    it 'correctly reports if a user is following another' do
      expect(user1.following?(user2)).to be false
      user1.follow(user2)
      expect(user1.following?(user2)).to be true
    end
  end
end
# rubocop:enable Metrics/ClassLength
