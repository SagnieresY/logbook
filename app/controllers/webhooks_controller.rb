class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!


  def receive
    authorize Flight
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end


    flight_hash = {}
    flight_param = data["form_response"]["answers"]

    flight_param.each do |attr|
      s = attr["type"]

      if s == "choice"
        flight_hash[attr["field"]["ref"].to_sym] = attr[s]["label"]
      elsif s == "email"
        flight_hash[attr["field"]["ref"].to_sym] = User.where(email:attr[s]).ids[0]
      else
        flight_hash[attr["field"]["ref"].to_sym] = attr[s]
      end
    end

    p flight_hash

    f = Flight.new(flight_hash)
    f.check_before_save
    f.save!

    redirect_to root_url, status: 200, notice:'Flight recorded'
  end
end



