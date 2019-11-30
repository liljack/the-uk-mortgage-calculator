#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require './lib/uk_mortgage_calculator'


# METHODS
def set_variables(argv)
  @monthly_repayment_calculator = UKMortgageCalculator::MonthlyRepaymentCalculator.new(argv[0].to_f, argv[1].to_f, argv[2].to_i)
  if argv[3]
    @overpayment = UKMortgageCalculator::OverpaymentCalculator.new(@monthly_repayment_calculator, argv[3].to_f, argv[4] ? true : false)
  end
end

def monthly_payment
  @monthly_repayment_calculator.monthly_payment
end

if ARGV.length < 3
  puts "Too few arguments - expect 3 or 4 received #{ARGV.length}"
  puts "Make sure you give the follow: Mortgage balance left to pay, rate, term left to pay in month. Optionally add an overpayment rate"
  exit
end

def year_range
  mortgage_term_in_year = (@monthly_repayment_calculator.repayment_term / 12).ceil
  1..mortgage_term_in_year
end



# Starting

set_variables(ARGV)


this_month_payment = monthly_payment
total_paid = 0

puts "----------- montly payment ------------"
puts "#{monthly_payment}"
puts "---------------------------------------"

(year_range).each do |year|
  puts "---------------- CALCULATING YEAR #{year} -------------"
  if @overpayment
    this_month_payment = @overpayment.monthly_payment_with_overpayment
    puts "allowed overpayment this year: #{@overpayment.allowed_overpayment_amount_for_year}"
  end
  (1..12).each do |month|
    puts "Balance:  #{@monthly_repayment_calculator.balance_left}"
    this_month_interest = @monthly_repayment_calculator.monthly_interest_for_month(Date.new((Date.today.year + year - 1), month, 1)).round(2)
    this_month_payment = monthly_payment + (@overpayment ? @overpayment.monthly_overpayment_amount : 0)
    this_month_payment = ((this_month_payment > @monthly_repayment_calculator.balance_left) ? @monthly_repayment_calculator.balance_left : this_month_payment)
    puts "Balance left: #{@monthly_repayment_calculator.balance_left}"
    puts "Payment:  #{this_month_payment}"
    puts "Interest: #{this_month_interest}"
    @monthly_repayment_calculator.balance_left -= this_month_payment
    @monthly_repayment_calculator.balance_left += this_month_interest
    total_paid += this_month_payment unless @monthly_repayment_calculator.balance_left <= 0

  end
  puts "#{@monthly_repayment_calculator.balance_left}"
end

left_to_pay = @monthly_repayment_calculator.balance_left <= 0 ? 0 : @monthly_repayment_calculator.balance_left
puts "TOTAL PAID: #{total_paid + left_to_pay}"
