module Tapp
  class Configuration
    attr_accessor :default_printer, :report_caller, :decoration

    def initialize
      reset
    end

    def reset
      self.default_printer = :pretty_print
      self.report_caller   = false
      self.decoration      = false
    end
  end
end
