require 'tapp/printer'
require 'tapp/util'

module Tapp
  module ObjectExtension
    def tapp(printer = Tapp.config.default_printer)
      Tapp::Util.report_called if Tapp.config.report_caller

      if Tapp.config.decoration
        require 'tapp/print_decorator'
        decorator = Tapp::PrintDecorator.instance
        decorator.register_printer(Tapp::Printer.instance(printer))
        tap {
          decorator.print block_given? ? yield(self) : self
        }
      else
        tap {
          Tapp::Printer.instance(printer).print block_given? ? yield(self) : self
        }
      end
    end

    def taputs(&block)
      tapp :puts, &block
    end
  end
end
