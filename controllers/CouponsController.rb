class CouponsController < ApplicationController

  get '/' do

  @coupons = CouponsModel.all
  erb :coupons_index

  end

end
