class HomeController < ApplicationController
  def index
    @ad = {
      title: "Advmeds Design",
      description: "Best Clinic reservation system",
      action_title: "more"
    }

    @products = [
      {
        id: "1",
        name: "ocean",
        description: "beautiful ocean",
        image_url: "https://static.pexels.com/photos/128458/pexels-photo-128458.jpeg"
      },

      {
        id: "2",
        name: "ocean",
        description: "Asia ocean",
        image_url: "https://static.pexels.com/photos/285223/pexels-photo-285223.jpeg"
      },
      {
        id: "3",
        name: "ocean",
        description: "America ocean",
        image_url: "https://static.pexels.com/photos/266142/pexels-photo-266142.jpeg"
      },
      {
        id: "4",
        name: "ocean",
        description: "Austrulia ocean",
        image_url: "https://static.pexels.com/photos/359558/pexels-photo-359558.jpeg"
      }
    ]
  end
end
