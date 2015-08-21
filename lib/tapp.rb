require 'tapp/configuration'
require 'tapp/deprecated'
require 'tapp/object_extension'

require 'tapp/printers/pretty_print'
require 'tapp/printers/puts'
require 'tapp/decorator'

module Tapp
  extend Deprecated

  class << self
    def config
      @config ||= Tapp::Configuration.new
    end

    def configure(&block)
      config.tap(&block)
    end
  end
end

Object.__send__ :include, Tapp::ObjectExtension
