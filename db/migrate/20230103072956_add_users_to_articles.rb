# frozen_string_literal: true

class AddUsersToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :int
  end
end
