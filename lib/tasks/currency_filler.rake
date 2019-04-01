namespace :currency_filler do
  desc 'fulfill database with currency'
  task fulfill_database: :environment do
    cf = CurrencyFetcher.new
    cf.data_parser.each { |el| Currency.create!(base: el.base, date: el.date, rates: el.rates) }
    puts "==== DONE ===="
  end
end
