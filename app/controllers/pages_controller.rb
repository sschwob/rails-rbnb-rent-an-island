class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @islands = Island.all.shuffle.take(3)
    @islands = Island.all.take(6)
  end
end
