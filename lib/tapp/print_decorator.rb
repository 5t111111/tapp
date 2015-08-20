module Tapp
  class PrintDecorator
    include Singleton

    def register_printer(printer)
      @printer = printer
    end

    def print(*args)
      decoration = "~*" * 30
      puts decoration
      @printer.print(*args)
      puts decoration
    end
  end
end
