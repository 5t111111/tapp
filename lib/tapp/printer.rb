require 'singleton'
require 'forwardable'

module Tapp
  class Printer
    include Singleton
    extend Forwardable

    delegate [:print] => :@delegator

    attr_accessor :klasses

    def initialize
      @klasses = {}
    end

    def setup(printer)
      @delegator = @klasses[printer].instance
    rescue NoMethodError
      raise NotImplementedError
    end
  end
end
