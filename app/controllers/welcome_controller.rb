class WelcomeController < ApplicationController
  def index
  end

  def auth
    binding.pry
    render json: params['hub.challenge'].to_i
  end
end
