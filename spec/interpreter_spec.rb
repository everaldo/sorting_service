require "spec_helper"

module SortingService
  describe Interpreter do
    subject { Interpreter.new }

    context "add book" do
      before do
        subject.book title: "The Hitchhiker's Guide to the Galaxy", 
          author: "Douglas Adams", edition_year: 1979
      end
      it "changes books count" do
        expect( subject.books.count ).to be_equal 1
      end
      
      it "stores the book" do
        expect { subject.books.find("Guide to the Galaxy") }.to_not be_nil
      end
    end

    context "add priority" do
      before do
        subject.priority key: :title, order: :asc
      end
      it "changes priority count" do
        expect( subject.priorities.count ).to be_equal 1
      end
      
      it "stores the prioritybook" do
        expect { subject.priorities.find("Guide to the Galaxy") }.to_not be_nil
      end
    end
  end
end
