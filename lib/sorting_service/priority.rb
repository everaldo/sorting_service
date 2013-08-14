module SortingService
  class Priority
    attr_accessor :key, :order

    DESCENDING_CONVERSION = ["desc", "descendent", "descendently", "descending",  "-1"]
    DESC_ORDER  = -1
    ASC_ORDER   =  1

    def initialize(args = {} )
      self.key = args[:key]
      if DESCENDING_CONVERSION.include? args[:order].to_s.downcase
        self.order = DESC_ORDER
      else
        self.order = ASC_ORDER
      end
    end

    def compare(book, another_book)
      result = book.public_send(key) <=> another_book.public_send(key)
      result * order
    end

    def to_s
      str_order = order == ASC_ORDER ? "asc" : "desc"
      "[#{key},#{str_order}]"
    end
  end
end
