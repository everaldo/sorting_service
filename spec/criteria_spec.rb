require "spec_helper"

module SortingService
  describe Criteria do
    let(:book)          { double "A book"     }
    let(:another_book)  { double "Another book" }

    let(:priority1) { double "Priority 1" }
    let(:priority2) { double "Priority 2" }
    let(:priority3) { double "Priority 3" }
    let(:priority4) { double "Priority 4" }
    let(:priority5) { double "Priority 5" }

    subject { Criteria.new [priority1, priority2, priority3, priority4, priority5] }

    before do
      priority1.stub(:compare).and_return 0
      priority2.stub(:compare).and_return 0
      priority3.stub(:compare).and_return 0
      priority4.stub(:compare).and_return 0
      priority5.stub(:compare).and_return 0
    end

    it "returns zero if the books are equal in all priority keys" do
      expect(subject.compare book, another_book).to be_equal 0
    end

    it "returns the first priority when the books doesn't have the same priority1 key" do
      priority1.stub(:compare).and_return :first
      expect(subject.compare book, another_book).to be_equal :first
    end

    it "returns the second priority when the books have the same priority1 key
        but differ on priority2 key" do
      priority2.stub(:compare).and_return :second
      expect(subject.compare book, another_book).to be_equal :second
    end

    it "returns the last priority when all, except the last priority keys are the same" do
      priority5.stub(:compare).and_return :last
      expect(subject.compare book, another_book).to be_equal :last
    end
    


  end
end

