class Country < ActiveRecord::Base
  has_many :languages
  has_many :cities

  def self.with_language_count(limit)
    joins(:languages).select("countries.name", "countries.continent", "countries.population", "COUNT(languages.id) as num_of_languages").group("countries.id").limit(limit)
  end

  def upcase_name
    name.upcase
  end
end
