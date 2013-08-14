module SortingService
  class Book
    include Comparable

    attr_accessor :title, :author, :edition_year

    def initialize(args = {})
      @title = args.fetch :title
      @author = args.fetch :author
      @edition_year = args.fetch :edition_year
    end

    def <=>(other)
      SortingService.compare(self, other)
    end

    def to_s
      "#{title} - #{author} - #{edition_year}"
    end
  end
end

