require 'spec_helper'


module SortingService
  describe Priority do
    let(:book) { double("A book", title: "Game of Thrones", author: "George R. R. Martin", edition_year: 1996)  } 
    let(:another_book) { double("Another book", title: "Harry Potter", author: "J. K. Rowling", edition_year: 1997 )  } 

    subject { Priority.new(key: :title, order: :asc) }

    context "in ascending order" do
      context "with a string key" do

        it "has the same priority for the same book" do
          expect(subject.compare book, book).to be_equal 0
          expect(subject.compare another_book, another_book).to be_equal 0
        end

        it "orders lexicographically" do
          expect(subject.compare book,another_book).to be_equal -1
          expect(subject.compare another_book, book).to be_equal 1
        end
      end

      context "with a numeric key" do
        subject { Priority.new key: :edition_year, order: :asc }

        it "has the same priority for the same book" do
          expect(subject.compare book, book).to be_equal 0
          expect(subject.compare another_book, another_book).to be_equal 0
        end

        it "orders numerically" do
          expect(subject.compare book,another_book).to be_equal -1
          expect(subject.compare another_book, book).to be_equal 1
        end
      end
    end

    context "in descending order" do
      subject { Priority.new key: :author, order: :desc }

      context "with a string key" do
        it "has the same priority for the same book" do
          expect(subject.compare book, book).to be_equal 0
          expect(subject.compare another_book, another_book).to be_equal 0
        end

        it "compares in reversal lexicographically order" do
          expect(subject.compare book, another_book).to be_equal 1
          expect(subject.compare another_book, book).to be_equal -1
        end

      end

      context "with a numeric key" do
        subject { Priority.new key: :edition_year, order: :desc }

        it "has the same priority for the same book" do
          expect(subject.compare book, book).to be_equal 0
          expect(subject.compare another_book, another_book).to be_equal 0
        end

        it "compare in reversal numerically order" do
          expect(subject.compare book, another_book).to be_equal 1
          expect(subject.compare another_book, book).to be_equal -1
        end
      end
    end
  end
end
