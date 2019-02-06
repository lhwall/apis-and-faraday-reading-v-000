class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get
    "https://api.foursquare.com/v2/venues/search" do |req|
      req.params['client_id'] = WPFHOMJ0433AIKNJ5XWLNE4FJOUJK23X2I5NSKKIL15DHR54
      req.params['client_secret'] = 1VGXYGNO0LVGYQCMOZB5BODIWJJ1NGVKLVJ32DK4GRKBMMWE
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
     @venues = body_hash["response"]["venues"]
     render 'search'
   end
