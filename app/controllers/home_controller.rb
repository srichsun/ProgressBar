class HomeController < ApplicationController
  def index
  end

  def boy
    @show_love = true
  end

  def girl
    @show_love = false
  end

  def friend
    @show_love = true
  end
end
