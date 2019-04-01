class CurrencyConverter
  attr_reader :params

  def converter(params)
    if params.empty?
      'Empty params'.to_json
    else
      params[:currency_from]
      currency = Currency.find_by(base: params[:currency_from])
      currency_value = currency&.rates[params[:currency_to]] rescue nil
      conversion_proccess = params[:amount].to_f * currency_value rescue nil
      solid_staff = conversion_proccess.round(2).to_s + ' ' + params[:currency_to] rescue nil
      solid_staff.to_json
    end
  end
end
