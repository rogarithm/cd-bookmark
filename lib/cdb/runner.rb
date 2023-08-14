require_relative 'bookmarker'

module Cdb
  class Runner
    attr_reader :option, :bookmarker

    def initialize(argv)
      @option = argv[0]
      @bookmarker = Bookmarker.new
    end

    def run
      puts @option
      #case @option
      #when "-h"
      #  @bookmarker.show_help_msg
    end
  end
end
