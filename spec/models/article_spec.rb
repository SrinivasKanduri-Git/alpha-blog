# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = Article.new(title: nil, description: nil, user_id: nil)
  end

  it 'tests article validations' do
    expect(@article).to_not be_valid
  end

  it 'requires a user' do
    expect(@article.save).to be(false) if @article.user.nil?
  end
end
