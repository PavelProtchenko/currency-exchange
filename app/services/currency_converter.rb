class CurrencyConverter
  attr_reader :params

  def converter(params)
    if params.empty?
      'Empty params'.to_json
    # elsif !params.include?(:amount) && !params.include?(:currency_from) && !params.include?(:currency_to)
    #   'Wrong parameters number'.to_json
    else
      params[:currency_from]
      currency = Currency.find_by(base: params[:currency_from])
      currency_value = currency&.rates[params[:currency_to]] rescue nil
      conversion_proccess = params[:amount].to_f * currency_value rescue nil
      solid_staff = conversion_proccess.round(2).to_s + ' ' + params[:currency_to] rescue nil
      solid_staff.to_json
    end
    # parsed_res = dynamic_url['rates'].values[0]
    # puts parsed_res

    # convert = params[:amount].to_f * parsed_res
    # b = convert.to_s + ' ' + params[:currency_to]
    # $redis.set('arr', '1221323')
    # $redis.expire('arr', 10.seconds)

    # puts "#{convert.round(2)} #{params[:currency_to]}"
    # b.to_json
  end
end
