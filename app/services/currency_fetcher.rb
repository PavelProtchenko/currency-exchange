require 'net/http'
require 'json'

class CurrencyFetcher
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def connect_to
    'https://ratesapi.io/api/latest'
  end

  def dynamic_url
    connect_to
    dynamic_part = "?base=#{params[:currency_from]}&symbols=#{params[:currency_to]}"
    url = connect_to + dynamic_part
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_object = JSON.parse(response)
    response_object
  end

  def url_substitution
    dynamic_url['rates'].keys.map do |uc|
      connect_to + "?base=#{uc}"
    end
  end

  def data_extractor
    url_substitution.map do |el|
      uri = URI(el)
      response = Net::HTTP.get(uri)
      response_object = JSON.parse(response)
      response_object
    end
  end

  def data_parser
    data_extractor.map do |el|
      OpenStruct.new(base: el['base'], date: el['date'], rates: el['rates'])
    end
  end

  def list_of_currencies
    currencies = dynamic_url['rates'].keys
    puts "========== LIST OF AVAILABLE CURRENCIES ==========\n\n#{currencies}\n\n"
    currencies
  end

  def currency_values
    currency_values = dynamic_url['rates'].values
    currency_values
  end
end

# cf.data_extractor.each { |el| Currency.create!(info: el) }
# cf.data_extractor.each { |el| Currency.update_all(info: el) }
# cf.data_parser.each { |el| Currency.create!(base: el.base, date: el.date, rates: el.rates) }