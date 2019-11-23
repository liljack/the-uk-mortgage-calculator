module UKMortgageCalculator

  class MonthlyRepaymentCalculator
    
    extend Forwardable
    include MethodHelper

    attr_reader :balance_left

    def initialize(mortgage_balance, interest_rate, repayment_term)
      @mortgage_detail = MortgageDetail.new(mortgage_balance, interest_rate, repayment_term)
      @balance_left = @mortgage_detail.mortgage_balance
    end

    def_delegators :@mortgage_detail, :mortgage_balance, :interest_rate, :repayment_term

    def monthly_payment
      calculated_monthly_payment
    end

    def monthly_interest_for_month(date)
      daily_interest(date) * MethodHelper.days_in_month(date.year, date.month)
    end

    def balance_left=(value)
      if value < 0
        @balance_left = 0
      else
        @balance_left = value.round(2)
      end
    end

    private

    def daily_interest(date)
      (balance_left * interest_rate / MethodHelper.number_of_days_in_year(date.year))
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

