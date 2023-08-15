require_relative 'bookmarker'

module Cdb
  class Runner
    attr_reader :option, :bookmarker

    def initialize(argv)
      @option = argv
      @bookmarker = Bookmarker.new
    end

    def run
      case @option.first
      when "-h"
        puts @bookmarker.show_help_msg
      when "-l"
        puts @bookmarker.list_bookmarks
      end
    end
  end
end
