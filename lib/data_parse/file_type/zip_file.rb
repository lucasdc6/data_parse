require 'zip'

module DataParse
  class ZipFile < FileType
    def extract_file
      raise InvalidFormat if !self.valid?
      Zip::File.open(@file) do |zip_file|
        zip_file.each do | file |
          file_path = File.join(@destination, file.name)
          zip_file.extract(file, file_path) unless File.exist?(file_path)
        end
      end
      @processed = true
    end

    def valid?
      Zip::File.open(@file).entries.collect { |file| file.name }.sort == @format.validate.sort
    end

  end
end
