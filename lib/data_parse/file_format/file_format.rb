module DataParse
  class FileFormat
    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def parse
      raise 'Implemented by Subclass'
    end

    def validate
      raise 'Implemented by Subclass'
    end

  end
end
