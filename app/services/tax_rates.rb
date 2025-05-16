module TaxRates

  SUPPORTED_CURRENCIES = [
    ["New Zealand", "NZ"]
  ]

  def self.supported_currencies
    SUPPORTED_CURRENCIES
  end

  def self.lookup(country_code)
    case country_code
    when "NZ"
      nz_tax_rates
    else
      nil
    end
  end

  private

  def self.nz_tax_rates
    [
      { "earnings_bracket" => 15600, "rate" => 10.5 },
      { "earnings_bracket" => 53500, "rate" => 17.5 },
      { "earnings_bracket" => 78100, "rate" => 30.0 },
      { "earnings_bracket" => 180000, "rate" => 33.0 },
      { "earnings_bracket" => 1000000, "rate" => 39.0 }
    ]
  end
end

