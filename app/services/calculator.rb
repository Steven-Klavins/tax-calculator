module Calculator
  def self.calculate_tax(country_code, earnings)
    tax_rates = TaxRates.lookup(country_code)

    return false if tax_rates.nil?

    # Track how much of the individuals earnings we have taxed throughout the loop
    taxed_earnings = 0
    tax_owed = 0
    previous_tax_rate_amount = 0

    tax_rates.each do |tax_rate|
      # If the last available tax rate has been reached, or the rate exceeds the users earnings,
      # calculate the remaining tax and break out of the loop.
      if tax_rate.equal?(tax_rates.last) || earnings < tax_rate["earnings_bracket"]
        tax_owed += ((earnings - taxed_earnings) * tax_rate["rate"]) / 100
        break
      else
        # Continue subtracting the previous rate limit and calculate the additionally owed tax.
        tax_owed += ((tax_rate["earnings_bracket"] - previous_tax_rate_amount) * tax_rate["rate"]) / 100
        taxed_earnings += tax_rate["earnings_bracket"] - previous_tax_rate_amount
      end
      previous_tax_rate_amount = tax_rate["earnings_bracket"]
    end

    tax_owed
  end
end
