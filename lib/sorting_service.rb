require "singleton"
require "sorting_service/version"
require "sorting_service/configuration"
require "sorting_service/priority"
require "sorting_service/criteria"
require "sorting_service/book"
require "sorting_service/books_sorter"
require "sorting_service/client"
require "sorting_service/interpreter"


module SortingService
  class OrderingException < Exception ; end

  def self.configure
    yield Configuration.instance
  end

  def self.config
    Configuration.instance
  end

  def self.criteria
    config.criteria
  end

  def self.criteria=(criteria)
    config.criteria = criteria
  end


  def self.compare(book, another_book)
    criteria.compare(book, another_book)
  end
end
