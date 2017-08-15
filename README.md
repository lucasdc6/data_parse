# DataParse

DataParse es una gema para parseo de la informacion contenidos en determinado formato, provenientes de archivos de un tipo especificado.
Por defecto, se cuenta con el tipo de archivo Zip, y el formato utilizado en un proyecto especifico, utilizando la gema ActiveSupport, para un proyecto Rails.

## Instalación

Se puede agregar a un proyecto, poniendo la siguiente línea en el Gemfile:

```ruby
gem 'data_parse'
```

Y ejecutando:

    $ bundle

O instalando manualmente de la siguiente manera:

    $ gem install data_parse

## Uso

Se cuenta con la clase Factory para facilitar la instanciación del objeto necesario.
Se puede utilizar de la siguiente forma

```ruby
DataParse::Factory::cyt_projects_zip(path_to_file)
```

De esta manera se instancia un objeto, que comprendera los siguientes mensajes:

- make_dir: Utilizado para especificar el directorio de salida (por defecto sera el directorio ./tmp)
- remove_dir: Elimina el directorio anteriormente creado, junto con todos los archivos tratados
- extract_file: Extrae los archivos a parsear
- parse: Ejecula la logica de parseo sobre los archivos
- valid?: Comprueba la validez del archivo a extraer

## Extensión

Es posible realizar una extensión de la gema agregando tanto nuevos tipos de archivos (tar, gzip, 7zip, rar, etc), como también agregando nuevos formatos de archivos.
Toda la logica de parseo se debe implementar bajo el mensaje parse(file), y subclasificando la clase FileFormat.
También es posible implementar el mensaje validate para proveer un modo de validar el archivo.

Toda subclasificacion es automaticamente agregada al factory para su uso, mediante un método que cumple el siguiente formato:

nombre de la sublcase de FileFormat(en snake case) + nombre del tipo de archivo
Ej:

Si se crea el tipo de archivo tar y el formato nuevo proyecto:

```ruby
module DataParse
    class Tar < DataType
    ...
    end
    
    class NuevoProyecto < DataFormat
    ...
    end
end
```

En este caso se contaran con los nuevos métodos: 
- nuevo_proyecto_tar(path_to_file)
- nuevo_proyecto_zip(path_to_file)

Cabe destacar que el formato por defecto tambien va a contar con el nuevo tipo de archivo, tar, generando el método
- cyt_project_tar(path)

## Aclaraciones

Dentro de la gema, se cuenta con la extensión de la clase Sting, agregando la función to_underscore, que tiene un comportamiento similar al del método underscore de rails.
Cualquier consulta o corrección, no dude en escribir a cualquiera de mis mails.

## License

La gema está disponible como código libre bajo los términos de la [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DataParse project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/data_parse/blob/master/CODE_OF_CONDUCT.md).
