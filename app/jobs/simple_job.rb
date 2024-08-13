require 'sidekiq'
class SimpleJob
  include Sidekiq::Job

  def perform(name, age, male)
    puts "JJJJ: Performing simple Sidekiq job."
    if male
      puts "JJJJ: Hello, Mr. #{name} #{age} years old."
    end
  end
end