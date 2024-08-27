# frozen_string_literal: true

class AddImagesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :image, :string
  end
end
