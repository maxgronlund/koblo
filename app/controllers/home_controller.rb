class HomeController < ApplicationController
  def index
    @remixes = Remix.original_remixes.first(4)
  end
end
