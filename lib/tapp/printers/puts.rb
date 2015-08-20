module Tapp
  module Printers
    class Puts
      include Singleton
      def print(*args)
        puts(*args)
      end
    end

    Printer.instance.klasses[:puts] = Puts
  end
end
