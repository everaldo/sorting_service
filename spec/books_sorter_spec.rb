require "spec_helper"

module SortingService
  describe BooksSorter do
    let(:java) { Book.new title: "Java How to Program", author: "Deitel & Deitel", edition_year: 2007  }
    let(:patterns) { Book.new  title: "Patterns of Enterprise Application Architecture", author: "Martin Fowler", edition_year: 2002  }
    let(:head_first) { Book.new  title: "Head First Design Patterns", author: "Elisabeth Freeman", edition_year: 2004  }
    let(:internet) { Book.new  title: "Internet & World Wide Web: How to Program", author: "Deitel & Deitel", edition_year: 2007  }
    let(:books) { [java, patterns, head_first, internet] }

    let(:auth_asc)      { Priority.new key: :author, order: :asc }
    let(:title_desc)    { Priority.new key: :title, order: :desc }
    let(:edition_desc)  { Priority.new key: :edition_year, order: :desc }
    let(:author_desc)   { Priority.new key: :author, order: :desc }
    let(:title_asc)     { Priority.new key: :title, order: :asc }

    let(:criteria1) { Criteria.new [title_asc] }
    let(:criteria2) { Criteria.new [auth_asc, title_desc] }
    let(:criteria3) { Criteria.new [edition_desc, author_desc, title_asc] }
    let(:criteria4) { Criteria.new nil }
    let(:criteria5) { Criteria.new [] }

    subject { BooksSorter }

    context "#sort" do
      context "Title ascending" do
        before do
          SortingService.criteria = criteria1
        end

        it "expects books 3, 4, 1, 2" do
          puts subject.sort books
          expect(subject.sort(books)).to eql([head_first, internet, java, patterns])
        end
      end

      context "Author ascending, Title descending" do
        before do
          SortingService.criteria = criteria2
        end

        it "expects books 1, 4, 3, 2" do
          expect(subject.sort(books)).to eql [java, internet, head_first, patterns]
        end
      end

      context "Edition descending, Author descending, Title ascending" do
        before do
          SortingService.criteria = criteria3
        end

        it "expects books 4, 1, 3, 2" do
          expect(subject.sort(books)).to eql [internet, java, head_first, patterns]
        end
      end


      context "without criteria" do
        it "raises an OrderingException" do
          expect { SortingService.criteria = criteria4 }.to raise_error OrderingException
        end
      end


      context "with an empty set" do
        before do
          SortingService.criteria = criteria5
        end
        
        it "returns an empty set" do
          expect(subject.sort(books)).to eql []
        end
      end
    end
  end
end

