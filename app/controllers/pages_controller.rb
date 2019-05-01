class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  # before_action :authenticate_user!

  skip_after_action :verify_authorized, only: [:home, :import]

  def home
  end

  def import
  end

end
