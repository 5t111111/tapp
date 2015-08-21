module Tapp
  class Configuration
    attr_accessor :default_printer
    attr_accessor :report_caller
    attr_accessor :decoration
    attr_accessor :colorization

    def initialize
      reset
    end

    def reset
      self.default_printer = :pretty_print
      self.report_caller   = false
      self.decoration      = true
      self.colorization    = true
    end
  end
end
