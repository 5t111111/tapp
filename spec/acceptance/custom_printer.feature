Feature: Custom printer
  Scenario: define a custom printer and use it
    Given I have the following code:
    """
    require 'tapp/printer'

    Tapp.config.decoration = false

    module Tapp::Printers
      class MyPrinter
        include Singleton
        def print(*args)
          puts "*** #{args.join(' ')} ***"
        end
      end

      Printer.instance.klasses[:my_printer] = MyPrinter
    end

    %w(foo bar).tapp(:my_printer)
    """

    When Ruby it
    Then I should see:
    """
    *** foo bar ***
    """
