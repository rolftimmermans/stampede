module Stampede
  class Runner::Configuration
    def initialize(config = {})
      @config = config
    end

    def max_connections
      @config[:max_connections] or @config[:"max-connections"]
    end

    def colorize?
      @config[:colors] or !@config[:"no-colors"]
    end

    def daemonize?
      @config[:daemonize]
    end

    def verbose?
      @config[:verbose]
    end

    def logger
      if daemonize?
        Logger.new "stampede.log", :colorize => colorize?
      else
        Logger.new $stdout, :buffer_size => 256, :colorize => colorize?
      end
    end
  end
end