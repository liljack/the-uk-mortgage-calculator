module UKMortgageCalculator

  class MonthlyRepaymentCalculator
    
    extend Forwardable
    include MethodHelper

    attr_accessor :current_year_balance

    def initialize(mortgage_detail)
      @mortgage_detail = mortgage_detail
      @current_year_balance = mortgage_detail.mortgage_balance
    end

    def_delegators :@mortgage_detail, :mortgage_balance, :interest_rate, :repayment_term

    def monthly_payment
      calculated_monthly_payment
    end

    def monthly_interest_for_current_month(date)
      daily_interest(date) * MethodHelper.days_in_month(date.year, date.month)
    end

    private

    def daily_interest(date)
      (current_year_balance * interest_rate / MethodHelper.number_of_days_in_year(date.year))
    end

    def calculated_monthly_payment
      monthly_rate = 1 + ((interest_rate) / 12)
      term_rate = monthly_rate**-repayment_term
      final_rate = 1 - term_rate
      balance_rate = (monthly_rate - 1) / final_rate
      (mortgage_balance * balance_rate).round(2)
    end

  end
end

