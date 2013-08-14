#!/usr/bin/env ruby

require 'bundler/setup'
require 'sorting_service'

def default_criteria
  title_asc   = SortingService::Priority.new key: :title, order: :asc
  author_asc  = SortingService::Priority.new key: :author, order: :asc
  [title_asc, author_asc]
end


SortingService.configure do |config|
  config.criteria = default_criteria
end


book1  = SortingService::Book.new author: "Deitel & Deitel", title: "Java How to Program", edition_year: 2007
book2  = SortingService::Book.new author: "Martin Fowler", title: "Patterns of Enterprise Application Architecture", edition_year: 2002
book3  = SortingService::Book.new author: "Elisabeth Freeman", title: "Head First Design Patterns", edition_year: 2004
book4  = SortingService::Book.new author: "Deitel & Deitel", title: "Internet & World Wide Web: How to Program", edition_year: 2007
books = [book1, book2, book3, book4]
#client = SortingService::Client.new books: books
auth_asc = SortingService::Priority.new key: :author, order: :asc
title_desc = SortingService::Priority.new key: :title, order: :desc
edition_desc = SortingService::Priority.new key: :edition_year, order: :desc
author_desc = SortingService::Priority.new key: :author, order: :desc
title_asc = SortingService::Priority.new key: :title, order: :asc

criteria1 = [title_asc]
criteria2 = [auth_asc, title_desc]
criteria3 = [edition_desc, author_desc, title_asc]
criteria4 = nil
criteria5 = []


client = SortingService::Client.new(books: books, criteria: criteria1)
puts client.sort
puts "**********************"
client = SortingService::Client.new(books: books, criteria: criteria2)
puts client.sort
puts "**********************"
client = SortingService::Client.new(books: books, criteria: criteria3)
puts client.sort
puts "**********************"
begin
client = SortingService::Client.new(books: books, criteria: criteria4)
puts client.sort
rescue SortingService::OrderingException
  puts "Exceção lançada"
end
puts "**********************"
client = SortingService::Client.new(books: books, criteria: criteria5)
puts client.sort
puts "**********************"
