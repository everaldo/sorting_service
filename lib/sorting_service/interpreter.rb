module SortingService
  class Interpreter
    attr_accessor :books, :priorities

    def initialize(&block)
      @books = []
      @priorities = []
      instance_eval(&block) if block_given?
    end


    def book(args)
      new_book = Book.new args
      @books << new_book
      new_book
    end

    def priority(args)
      new_priority = Priority.new args
      @priorities << new_priority
      new_priority
    end

    def show
      puts <<-EOF.gsub /^\s+/, ""
      BOOKS = {
        #{@books.map(&:to_s).join("\n\t")}
      }
      PRIORITIES = {
        #{@priorities.map(&:to_s).join("\n\t")}}

      EOF
    end

    def sort
      client = Client.new(books: books, criteria: priorities)
      puts client.sort
    end
  end
end
