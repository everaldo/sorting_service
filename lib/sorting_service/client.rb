module SortingService
  class Client
    attr_accessor :books, :criteria

    def initialize(options = {})
      @books = options.fetch :books, nil
      @criteria = Criteria.new(options[:criteria])
      set_criteria
    end

    def sort
      BooksSorter.sort books
    end

    private
    def set_criteria
      raise OrderingException if criteria.nil?
      SortingService.criteria = criteria
    end
  end
end
