class Article < ActiveRecord::Base

  establish_connection adapter: 'mysql2', database: 'Test-App_development'
  connection.create_table table_name, force: true do |t|
    t.string :title
    t.belongs_to :user
  end

  class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add(attribute, "must start with 'the'") unless value =~ /\Athe/i
    end
  end

end
