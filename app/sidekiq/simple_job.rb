# frozen_string_literal: true

require 'sidekiq'
class SimpleJob
  include Sidekiq::Job

  def perform(name, age, male)
    puts 'JJJJ: Performing simple Sidekiq job.'
    return unless male

    puts "JJJJ: Hello, Mr. #{name} #{age} years old."
  end
end
