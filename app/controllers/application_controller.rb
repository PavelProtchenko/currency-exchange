class ApplicationController < ActionController::API
  def change
    if params.presence
      cf = CurrencyConverter.new.converter(currency_params)
      render json: cf, status: :ok
    else
      render json: cf.errors, status: :unprocessable_entity
    end
  end

  private

  def currency_params
    params.permit(:amount, :currency_from, :currency_to)
  end
end
