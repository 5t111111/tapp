require 'tapp/printer'
require 'tapp/util'

module Tapp
  module ObjectExtension
    def tapp(printer = Tapp.config.default_printer)
      Tapp::Printer.instance.decorated = true if Tapp.config.decoration
      Tapp::Util.report_called if Tapp.config.report_caller
      tap do
        Tapp::Printer.instance.setup(printer).print block_given? ? yield(self) : self
      end
    end

    def taputs(&block)
      tapp :puts, &block
    end
  end
end
