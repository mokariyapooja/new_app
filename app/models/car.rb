class Car < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  ##for error masseges
  def display_errors
    self.errors.full_messages.join(', ')
  end
end
