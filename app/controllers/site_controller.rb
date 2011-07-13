class SiteController < ApplicationController

  before_filter :login_required

  def index
    @title = "Inicio"
  end
end
