class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @islands = Island.all.shuffle.take(2)
  end
end
