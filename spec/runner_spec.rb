require_relative '../lib/cdb/runner'
require_relative '../lib/cdb/bookmarker'

describe "Runner", "operations" do
  it "should have option and bookmark object when initialized" do
    runner = Cdb::Runner.new(["-h"])
    runner.option.should == "-h"
    runner.bookmarker.should be_an_instance_of(Cdb::Bookmarker)
  end
end

