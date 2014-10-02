class HomeController < ApplicationController
  def index
    @remixes = Remix.first(2)
  end
end
