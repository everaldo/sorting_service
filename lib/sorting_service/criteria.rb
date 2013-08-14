module SortingService
  class Criteria
    attr_accessor :priorities

    def initialize(priorities)
      raise OrderingException if priorities.nil?
      self.priorities = priorities
    end

    def compare(book, another_book)
      result = 0
      priorities.each do |priority|
        result = priority.compare(book, another_book)
        return result unless result == 0
      end
      result
    end

    def to_s
      "[ #{priorities.map(&:to_s).join(" ")} ]"
    end

    def empty?
      priorities.empty?
    end

  end
end
