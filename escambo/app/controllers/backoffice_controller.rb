class BackofficeController < ApplicationController
  before_filter :authenticate_admin!
  layout "backoffice"
end
