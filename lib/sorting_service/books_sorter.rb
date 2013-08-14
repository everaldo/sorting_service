module SortingService

  module BooksSorter

    def self.sort(books)
      raise OrderingException if books.nil? 
      return [] if SortingService.criteria.empty?
      books.sort
    end
  end
end
