namespace :currency_filler do
  desc 'update currency one time per day'
  task fulfill_database: :environment do
    cf = CurrencyFetcher.new
    cf.data_parser.each { |el| Currency.create!(base: el.base, date: el.date, rates: el.rates) }
    puts "==== DONE ===="
  end
end
