class HomeController < ApplicationController
  def index
    @ad = {
      title: "Advmeds Design",
      description: "Best Clinic reservation system",
      action_title: "more"
    }

    @products = []
    (1..100).each do |index|
      @products <<
      {
        id: "#{index}",
        name: "ocean",
        description: "beautiful ocean",
        image_url: "https://static.pexels.com/photos/128458/pexels-photo-128458.jpeg"
      }
    end
  end
end
