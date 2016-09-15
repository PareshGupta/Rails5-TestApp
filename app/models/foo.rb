module Foo
  class Bar
    extend ActiveModel::Naming

    include ActiveModel::AttributeMethods

    attribute_method_prefix 'clear_'

    define_attribute_methods :name, :age

    attr_accessor :name, :age

    private

      def clear_attributes(attr)
        send("#{attr}=", nil)
      end

  end
end
