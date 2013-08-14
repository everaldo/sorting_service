module SortingService
  class Configuration
    include Singleton
    extend Forwardable
    
    attr_accessor :criteria

    def_delegators :criteria, :compare
  end
end

