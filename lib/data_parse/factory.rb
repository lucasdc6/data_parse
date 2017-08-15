require "string"

module DataParse
  class Factory
    class << self
      DataParse::FileType.descendants.each do |type|
        type_t = type.to_s.split('::').last.to_underscore
        DataParse::FileFormat.descendants.each do |format|
          format_t = format.to_s.split('::').last.to_underscore
          define_method "#{format_t}_#{type_t}" do |value|
            type.new(value, format.new)
          end
        end
      end
    end
  end
end
