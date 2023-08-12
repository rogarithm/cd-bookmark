require_relative './bookmarker'

describe "Bookmarker", "operations" do
  it "should make new database file if not exists"
  it "should create bookmark if given option is -c" do
    #bmk = Bookmarker.new
    #bmk.create('test_bookmark')
  end
  it "should throw an exception if a bookmark to create is already created"
  it "should delete bookmark if given option is -d"
  it "should throw an exception if you did not specify a bookmark to delete"
  it "should list bookmark if given option is -l"
  it "should show simple help document -h" do
    bmk = Bookmarker.new
    bmk.show_help_msg.should == <<-END_OF_MSG
Usage: cdb [-c|-g|-d|-l] [bookmark]
-c: create bookmark
-g: goto bookmark
-d: delete bookmark
-l: list bookmarks'
    END_OF_MSG
  end
  it "should go to directory of given bookmark"
  it "should throw an exceptioin if given bookmark you want to go doesn't exist"
end
