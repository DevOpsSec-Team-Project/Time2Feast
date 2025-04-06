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

  # Format the duration as String based on integer values for hrs and mins
  def formatted_duration
    return 'NA' if hours.nil? && minutes.nil?

    parts = []

    if hours.present? && hours > 0
      parts << "#{hours} #{hours == 1 ? 'hr' : 'hrs'}"
    end

    if minutes.present? && minutes > 0
      parts << "#{minutes} #{minutes == 1 ? 'min' : 'mins'}"
    end

    parts.empty? ? 'NA' : parts.join(' ')
  end

end
