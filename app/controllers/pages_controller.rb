class PagesController < ApplicationController
  def index
    @supported_currencies = TaxRates.supported_currencies
  end

  def calculate_tax
    earnings = calculate_tax_params[:earnings].to_f.round(2)
    country_code = calculate_tax_params[:country_code]
    calculation = Calculator.calculate_tax(country_code, earnings)

    if calculation
      @calculation_result = "$#{'%.2f' % calculation}"

      render turbo_stream: turbo_stream.replace("calculation_result",
                                                partial: "calculation_result",
                                                locals: { calculation_result: @calculation_result })
    else
      render turbo_stream: turbo_stream.replace("calculation_result",
                                                partial: "calculation_result",
                                                locals: { calculation_result: "Error: Unsupported currency..." })
    end
  end

  private

  def calculate_tax_params
    params.require(:tax_calculator).permit(:earnings, :country_code)
  end
end
