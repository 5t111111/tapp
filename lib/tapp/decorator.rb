require 'highline'

module Tapp
  class Decorator
    include Singleton

    def setup(printer)
      @printer = printer
      @colors = %i( red green yellow blue magenta cyan )
      @high_line = HighLine.new
      @colorization = Tapp.config.colorization
    end

    def print(*args)
      style = "~*" * 30
      deco = @colorization ? @high_line.color(style, @colors.sample) : style
      puts deco
      @printer.print(*args)
      puts deco
    end
  end
end
