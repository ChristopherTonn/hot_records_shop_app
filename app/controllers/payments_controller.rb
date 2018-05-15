class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @user = current_user
    @product = Product.find(params[:product_id])

    begin
      charge = Stripe::Charge.create(
        amount: 2000, # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )

      if charge.paid
        Order.create(
          user_id = @user.id,
          product_id = @product.id,
          total: @product.price
        )

        flash[:success] = "Your payment was processed successfully"
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(product)
  end
end
end
