require 'date'

module UKMortgageCalculator

  require 'forwardable'
  require_relative 'uk_mortgage_calculator/constant'
  require_relative 'uk_mortgage_calculator/uk_mortgage_calculator_helper'
  require_relative 'uk_mortgage_calculator/mortgage_detail'
  require_relative 'uk_mortgage_calculator/monthly_repayment_calculator'
  require_relative 'uk_mortgage_calculator/overpayment_calculator'
  require_relative 'uk_mortgage_calculator/degressive_overpayment_calculator'

  puts "included!"

  #puts "----------- montly payment ------------"
  #puts "#{MonthlyRepaymentCalculator.monthly_payment}"
  #puts "---------------------------------------"
  #
  #this_year_balance = Constant::CURRENT_MORTGAGE_BALANCE
  #current_year_balance = Constant::CURRENT_MORTGAGE_BALANCE
  #total_monthly_payments = 0
  #(1..Constant::TERM_YEAR_LEFT).each do |year|
  #  (1..12).each do |month|
  #    this_month_payment = MonthlyRepaymentCalculator.monthly_payment_with_overpayment(this_year_balance)
  #    this_month_interest = MonthlyRepaymentCalculator.monthly_interest(current_year_balance, Date.new((Date.today.year + year - 1), month, 1))

  #    current_year_balance -= this_month_payment
  #    current_year_balance += this_month_interest

  #    total_monthly_payments += MonthlyRepaymentCalculator.monthly_payment + this_month_interest

  #    current_year_balance = 0 if current_year_balance < 0
  #    current_year_balance = current_year_balance.round(2)

  #    puts "month #{year * 12 + month} left to pay: #{current_year_balance} - payment: #{current_year_balance <= 0 ? 0 : current_year_balance < MonthlyRepaymentCalculator.monthly_payment ? current_year_balance : this_month_payment.round(2)}"
  #  end

  #  puts "---------------- CALCULATING YEAR #{year} -------------"
  #  #current_year_balance = CURRENT_MORTGAGE_BALANCE - (monthly_payment * 12 * year)
  #  this_year_balance = current_year_balance
  #  puts "#{current_year_balance}"
  #  puts "total monthly payments: #{total_monthly_payments}"

  #end
end
