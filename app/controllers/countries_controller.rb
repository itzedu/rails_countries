class CountriesController < ApplicationController
  def index
    @countries = Country.with_language_count(15)
  end
end
