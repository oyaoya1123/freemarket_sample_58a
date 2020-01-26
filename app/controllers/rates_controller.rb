class RatesController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :result, only: [:index, :pu_user_rate]

  def index
  end

  def pu_user_rate
  end

end
