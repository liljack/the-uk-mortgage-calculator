module UKMortgageCalculator

  class OverpaymentCalculator

    extend Forwardable

    attr_accessor :overpayment_rate

    def initialize(monthly_repayment_calculator, overpayment_rate)
      @monthly_repayment_calculator = monthly_repayment_calculator
      @current_year_balance = current_year_balance
      @overpayment_rate = overpayment_rate
    end

    def_delegators :@monthly_repayment_calculator, :monthly_payment, :monthly_interest_for_current_month, :mortgage_balance, :interest_rate, :repayment_term

    

    def monthly_payment_with_overpayment
      monthly_payment + overpayment_amount
    end

    #def monthly_payment_with_overpayment(this_year_balance)
    #  monthly_payment + over_payment_per_month_for_year(this_year_balance)
    #end

    def overpayment_amount
      @overpayment_amount ||= overpayment_per_month_for_year
    end

    private

    def overpayment_per_month_for_year
      (current_year_balance / 10) / 12
    end

    def calculated_interest_for_year(year)
      monthly_payment / (mortgage_balance * (interest_rate * 100))
    end

  end

end
