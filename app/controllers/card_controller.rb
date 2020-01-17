class CardController < ApplicationController
  
  require "payjp"

  def new
  end

  def pay_create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    # Payjp.api_key = 'sk_test_6f334c848873c353c20f0754'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to controller: 'users', action: 'complete'
      else
        redirect_to action: "new"
      end
    end
  end

end
