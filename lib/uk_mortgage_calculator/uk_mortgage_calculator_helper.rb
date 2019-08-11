module UKMortgageCalculator

  module MethodHelper
    
    def self.days_in_month(year = Date.today.year, month = Date.today.month)
      (Date.new(year, 12, 31) << (12-month)).day
    end

    def self.number_of_days_in_year(year = Date.today.year)
      Date.new(year, 12, 31).yday
    end

  end

end
