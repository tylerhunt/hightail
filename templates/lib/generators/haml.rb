module Haml
  module Generators
    module GeneratorExtensions
      def parse_attributes!
        super

        attributes.each do |attribute|
          attribute.extend(FormBuilderGeneratedAttributeExtensions)
        end
      end
    end

    module FormBuilderGeneratedAttributeExtensions
      def field_type
        @field_type ||= case type
          when :integer              then :number
          when :float, :decimal      then :text
          when :time                 then :time
          when :datetime, :timestamp then :date_time
          when :date                 then :date
          when :text                 then :area
          when :boolean              then :checkbox
          else :text
        end
      end
    end
  end
end
