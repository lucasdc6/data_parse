module DataParse
  class FileFormat
    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    # Recibo el destino donde se encuentran todos los archivios a parsear
    # Los nombres se encuentran especificados en el método validate en formato de array
    # Por convension, se llama al método parse + nombre del archivo
    # Si se desea cambiar esto, se puede redefinir este método
    def parse(destination)
      raise FileIsNil if destination.nil?
      @destination = destination
      before
      validate.each do |file|
        file = File.basename(file,File.extname(file))
        method = "parse_#{file}".to_sym
        self.send method
      end
      after
    rescue ParseInterrupt
      parse_rescue
    end

    # Todo lo que se requiera hacer antes de iniciar el parseo de la información
    def before;end

    # Todo lo que se requiera hacer al terminar el parseo de la información
    def after;end

    # Que hacer cuando se lanza la excepcion ParseInterrup
    def parse_rescue
      raise
    end

    def validate
      raise 'Implemented by Subclass'
    end

  end
end
