class Recipe < ApplicationRecord

  belongs_to :user
  validates :user, presence: true
  
  # Store as YAML in DB, but expose as array

  # Getter for ingredients
  def parsed_ingredients
    YAML.load(ingredients || "") rescue []
  end

  # Getter for steps
  def parsed_steps
    YAML.load(steps || "") rescue []
  end

  # Setter for ingredients
  def parsed_ingredients=(value)
    self.ingredients = value.to_yaml
  end

  # Setter for steps
  def parsed_steps=(value)
    self.steps = value.to_yaml
  end

end
