# DataParse

DataParse es una gema para parseo de la informacion contenidos en determinado formato, provenientes de archivos de un tipo especificado.
Por defecto, se cuenta con el tipo de archivo Zip, y la posibilidad de subclasificar FileFormat para determinar como tratar los archivos descomprimidos.

## Instalación

Se puede agregar a un proyecto, poniendo la siguiente línea en el Gemfile:

```ruby
gem 'data_parse'
```

Y ejecutando:

    $ bundle

O instalando manualmente de la siguiente manera:

    $ gem install data_parse


## Aclaraciones

Dentro de la gema, se cuenta con la extensión de la clase Sting, agregando la función to_underscore, que tiene un comportamiento similar al del método underscore de rails.
Cualquier consulta o corrección, no dude en escribir a cualquiera de mis mails.

## License

La gema está disponible como código libre bajo los términos de la [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DataParse project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/data_parse/blob/master/CODE_OF_CONDUCT.md).
