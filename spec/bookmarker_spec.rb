require_relative '../lib/cdb/bookmarker'

describe "Bookmarker", "operations" do
  before(:each) do
    @bmk = Cdb::Bookmarker.new
    @bmk.bookmark_db = "/Users/sehun/tools/cdb/.test_cd_bookmarks"
  end

  after(:each) do
    File.open(@bmk.bookmark_db, 'w') {|file| file.truncate(0) }
  end

  it "should make new database file if not exists" do
    lambda { @bmk = Cdb::Bookmarker.new("/Users/sehun/tools/cdb/.db_not_created") }.should raise_error(ArgumentError)
  end
  it "should create bookmark" do
    @bmk.add_bookmark("test", "/Users/sehun/test")
    @bmk.list_bookmarks.should include("test:/Users/sehun/test")
  end
  it "should throw an exception if a bookmark to create is already created" do
    @bmk.add_bookmark("test", "/Users/sehun/test")
    lambda { @bmk.add_bookmark("test", "/Users/sehun/test") }.should raise_error(ArgumentError)
  end
  it "should delete bookmark" do
    @bmk.add_bookmark("a", "/Users/sehun/a")
    @bmk.add_bookmark("b", "/Users/sehun/b")
    @bmk.add_bookmark("c", "/Users/sehun/c")
    @bmk.remove_bookmark("a")
    @bmk.exists?("a").should == false
  end
  it "should throw an exception if name was not given" do
    lambda { @bmk.remove_bookmark('') }.should raise_error(ArgumentError)
    lambda { @bmk.remove_bookmark() }.should raise_error(ArgumentError)
  end
  it "should throw an exception if there's no registered bookmark for given name" do
    lambda { @bmk.remove_bookmark('unregistered') }.should raise_error(ArgumentError)
  end
  it "should list bookmark satisfying regex" do
    bookmarks = @bmk.list_bookmarks
    bookmarks.each do |bookmark|
      bookmark.split(":").first.should match /\S+/
      bookmark.split(":").last.should match /\S+/
    end
  end
  it "should show simple help document" do
    @bmk.show_help_msg.should == <<-END_OF_MSG
Usage: cdb [-c|-g|-d|-l] [bookmark]
-c: create bookmark
-g: goto bookmark
-d: delete bookmark
-l: list bookmarks
    END_OF_MSG
  end
  it "should return path of given bookmark" do
    @bmk.add_bookmark("a", "/Users/sehun/a")
    @bmk.add_bookmark("b", "/Users/sehun/b")
    @bmk.add_bookmark("c", "/Users/sehun/c")
    @bmk.find_path("a").should == "/Users/sehun/a"
  end
  it "should throw an exception if name was not given" do
    lambda { @bmk.find_path() }.should raise_error(ArgumentError)
  end
  it "should throw an exception if given bookmark you want to go doesn't exist" do
    lambda { @bmk.find_path('a') }.should raise_error(ArgumentError)
  end
end
