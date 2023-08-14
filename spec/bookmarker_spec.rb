require_relative '../lib/cdb/bookmarker'

describe "Bookmarker", "operations" do
  before(:each) do
    @bmk = Cdb::Bookmarker.new
  end
  it "should make new database file if not exists"
  it "should create bookmark" do
    #bmk = Bookmarker.new
    #bmk.create('test_bookmark')
  end
  it "should throw an exception if a bookmark to create is already created"
  it "should delete bookmark"
  it "should throw an exception if you did not specify a bookmark to delete"
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
  it "should go to directory of given bookmark"
  it "should throw an exception if given bookmark you want to go doesn't exist"
end
