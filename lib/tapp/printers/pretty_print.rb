module Tapp
  module Printers
    class PrettyPrint
      require 'pp'
      include Singleton
      def print(*args)
        pp(*args)
      end
    end

    Printer.instance.klasses[:pretty_print] = PrettyPrint
  end
end
