class CardController < ApplicationController
  def new
  end

  def pay_create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #binding.pry
    if params['payjp-token'].blank?
      #binding.pry
      redirect_to action: "new"
    else
      #binding.pry
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        #binding.pry
        redirect_to action: "show"
      else
        #binding.pry
        redirect_to action: "pay"
      end
    end
  end

  def show
  end
end
