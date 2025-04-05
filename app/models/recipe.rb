class Recipe < ApplicationRecord

  belongs_to :User

  #Store as YAML in database, but show as array

  # Ingredients getter
  def Ingredients
    YAML.load(read_attribute(:ingredients)) rescue[]
  end

  # Ingredients setter
  def ingredients=(value)
    write_attribute(:ingredients, value.to_yaml)
  end

  # Steps getter
  def Steps
    YAML.load(read_attribute(:steps)) rescue []
  end

  # Steps setter
  def steps=(value)
    write_attribute(:steps, value.to_yaml)
  end
  
end
