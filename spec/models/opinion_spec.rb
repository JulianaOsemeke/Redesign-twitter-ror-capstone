require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user) do
    User.create(username: 'Juliana', fullname: 'Juliana', email: 'test@test.com', password: 'password',
                password_confirmation: 'password')
  end

  context 'validations' do
    it 'fails when opinion not present' do
      expect(Opinion.new(user_id: user.id).valid?).to be false
    end

    it 'fails when opinion is too long' do
      expect(Opinion.new(opinion: 'j' * 281, user_id: user.id).valid?).to be false
    end

    it 'validates when opinion is valid' do
      expect(Opinion.new(opinion: 'A valid opinion', user_id: user.id).valid?).to be true
    end
  end

  context 'associations' do
    it 'correctly associates to the author' do
      opinion = user.opinions.create(opinion: 'A valid opinion')
      expect(opinion.author.id).to be user.id
    end
  end
end
