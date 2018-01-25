class HomeController < ApplicationController
  def index
    @ad = {
      title: "Advertising title",
      description: "Advertising description",
      action_title: "more"
    }
  end
end
