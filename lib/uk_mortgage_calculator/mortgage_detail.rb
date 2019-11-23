module UKMortgageCalculator

  class MortgageDetail

    attr_accessor :mortgage_balance, :interest_rate, :repayment_term, :start_date

    def initialize(mortgage_balance, interest_rate, repayment_term, start_date)
      @mortgage_balance = mortgage_balance
      @interest_rate = interest_rate / 100
      @repayment_term = repayment_term
      @start_date = start_date.is_a?(Date) ? start_date : Date.strptime(start_date, "%Y-%m-%d")
    end
 
  end 

end
