module DataParse
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
end
