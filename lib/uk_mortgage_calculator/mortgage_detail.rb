module UKMortgageCalculator

  class MortgageDetail

    attr_accessor :mortgage_balance, :interest_rate, :repayment_term

    def initialize(mortgage_balance, interest_rate, repayment_term)
      @mortgage_balance = mortgage_balance
      @interest_rate = interest_rate / 100
      @repayment_term = repayment_term
    end
 
  end 

end
