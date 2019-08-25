module UKMortgageCalculator

  class DegressiveOverpaymentCalculator

    extend Forwardable

    attr_accessor :overpayment_rate

    def initialize(monthly_repayment_calculator, overpayment_rate)
      @monthly_repayment_calculator = monthly_repayment_calculator
      @overpayment_rate = overpayment_rate
    end

    def_delegators :@monthly_repayment_calculator, :monthly_payment, :balance_left

    

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
       calculated_overpayment_for_year / 12
    end

    def calculated_overpayment_for_year
      puts "the balance_left is: #{balance_left}"
      @monthly_repayment_calculator.balance_left / overpayment_rate
    end

  end

end
