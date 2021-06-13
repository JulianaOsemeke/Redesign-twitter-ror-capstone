RSpec.describe Opinion, type: :model do
  current_user = User.first_or_create!(email:'dean@gmail.com', password: 'password', password_confirmation: 'password')
  it 'has an opinion at least 280 characters long' do
    opinion = Opinion.new{
      opinion = 'This is a valid opinion'
    }
    expect(opinion).to_be_valid
  end
  
end
