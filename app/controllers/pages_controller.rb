class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in?
  end
  def about
  end

  def simple_sidkiq_job
    SimpleJob.perform_in(10.seconds, "srinivas", 25, true)
    # respond_to do |format|
    #   format.turbo_stream { head :ok }
    # end
  end
end
