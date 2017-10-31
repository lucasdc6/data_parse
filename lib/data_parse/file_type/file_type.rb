require 'fileutils'

module DataParse
  class FileType
    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def initialize(file, format)
      @file = file
      @format = format
    end

    def make_dir(destination = 'tmp')
      @destination = destination
      FileUtils.mkdir_p(@destination)
      self
    end

    def remove_dir
      FileUtils.rm_rf(@destination) if !@destination.nil?
    end

    def valid?
      raise 'Implemented by Subclass'
    end

    def parse
      @format.parse(@destination) if @processed
    end
  end
end
