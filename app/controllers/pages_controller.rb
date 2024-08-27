# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in?
  end

  def about; end

  def simple_sidkiq_job
    SimpleJob.perform_in(10.seconds, 'srinivas', 25, true)
  end
end
