class Backoffice::DashboardController < ApplicationController
  before_filter :authenticate_admin!

  layout "backoffice"

  def index
  end
end
