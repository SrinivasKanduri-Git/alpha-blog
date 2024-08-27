# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(username: 'John_doe', email: 'john@example.com', password: 'something')
  end
  it 'data should be valid' do
    expect(@user).to be_valid
  end

  it 'tests article deletion' do
    @user.save
    expect(@user.articles).to eq([]) if @user.destroy
  end
end
