module DataParse
  class InvalidFormat < StandardError
    def initialize(msg = "Invalid format")
      super msg
    end
  end

  class FileIsNil < StandardError
    def initialize(msg = "Path to files could not be nil")
      super msg
    end
  end

  class ParseInterrupt < StandardError
    def initialize(msg = "Parse interrupted")
      super msg
    end
  end

  class SubClassResponsability < StandardError
    def initialize(msg = "The subclass must be define this method")
      super msg
    end
  end
end
