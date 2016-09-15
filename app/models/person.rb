# class Person < ActiveRecord::Base

#   # include ActiveModel::AttributeMethods

#   # attribute_method_prefix 'clear_'

#   # define_attribute_methods :name, :age

#   attr_accessor :name, :age

#   private

#     # def clear_attributes(attr)
#     #   send("#{attr}=", nil)
#     # end

# end


# class Person
#   include ActiveModel::Dirty

#   define_attribute_methods :name

#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(val)
#     name_will_change! unless val == @name
#     @name = val
#   end

#   def save
#     # do persistence work

#     changes_applied
#   end

#   def reload!
#     # get the values from the persistence layer

#     clear_changes_information
#   end

#   def rollback!
#     restore_attributes
#   end
# end

class Person
  # Required dependency for ActiveModel::Errors
  extend ActiveModel::Naming

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  attr_accessor :name
  attr_reader   :errors

  def validate!
    errors.add(:name, :blank, message: "cannot be nil") if name.nil?
  end

  # The following methods are needed to be minimally implemented

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def self.human_attribute_name(attr, options = {})
    attr
  end

  def self.lookup_ancestors
    [self]
  end
end