class SiteController < ApplicationController
  def index
    # retrieve all Katas ordered by descending creation timestamp
    @katas = Kata.order('created_at desc')
  end
end