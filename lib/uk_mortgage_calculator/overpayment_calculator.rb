module UKMortgageCalculator

  class OverpaymentCalculator

    extend Forwardable

    attr_accessor :overpayment_rate

    def initialize(repayment_calculator, overpayment_rate, degressive = false)
      @repayment_calculator = repayment_calculator
      @overpayment_rate = overpayment_rate
      @degressive = degressive
    end

    def_delegators :@repayment_calculator, :monthly_payment, :mortgage_balance, :balance_left

    

    def monthly_payment_with_overpayment
      monthly_payment + monthly_overpayment_amount
    end

    def monthly_overpayment_amount
      calculated_overpayment_per_month_for_year.round(2)
    end

    def allowed_overpayment_amount_for_year
      calculated_overpayment_for_year.round(2)
    end

    private

    def calculated_overpayment_per_month_for_year
       (calculated_overpayment_for_year / 12).round(2)
    end

    def calculated_overpayment_for_year
      if @degressive
        @repayment_calculator.balance_left * (overpayment_rate / 100)
      else
        @repayment_calculator.mortgage_balance * (overpayment_rate / 100)
      end
    end

  end

end
