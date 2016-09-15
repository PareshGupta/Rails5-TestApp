class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class User < ActiveRecord::Base
  validates :first_name, presence: true
  # validates :last_name, numericality: { only_integer: true }
  # validates :first_name, length: { within: 3..8, is: 2 }

  # validates_length_of :first_name, is: 2, within: (3..5)
  # validates_size_of :last_name, minimum: 2, maximum: 5

  # validates_exclusion_of :first_name, in: %w( paresh parry manii)
  # validates_format_of :email, with: /\w/
  # validates_confirmation_of :first_name

  validates :last_name, presence: true
  # # validates :first_name, email: true
  validates :email, presence: true
  # validates :email, presence: true
  # validates :email, email: true
  # validates :first_name, :'article/title' => true

  # validate :custom_validation

  # before_validation :abc

  # def abc
  #   puts 'hello'
  #   # return false
  #   throw :abort
  # end

  # def custom_validation
  #   puts 'it is a custom validation.'
  # end

  has_many :articles

  def fullname
    first_name + last_name
  end

end
