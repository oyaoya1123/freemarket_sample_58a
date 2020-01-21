class CardController < ApplicationController
  
  require "payjp"

  def new
  end

  def pay_create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
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

  def pay_create_aside
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to controller: 'users', action: 'card'
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to controller: 'users', action: 'show'
      else
        redirect_to controller: 'users', action: 'card'
      end
    end
  end

  def pay_delete_aside #PayjpとCardデータベースを削除します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to controller: 'users', action: 'card'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to controller: 'users', action: 'show'
  end

end
