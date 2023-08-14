module Cdb
  class Bookmarker
    def initialize
      @bookmark_db="/Users/sehun/tools/cdb/.cd_bookmarks"
    end

    def show_help_msg
      msg = <<-END_OF_MSG
Usage: cdb [-c|-g|-d|-l] [bookmark]
-c: create bookmark
-g: goto bookmark
-d: delete bookmark
-l: list bookmarks
      END_OF_MSG
      msg
    end

    def list_bookmarks
      bookmarks = []
      File.open(@bookmark_db) do |file|
        file.each_line {|line| bookmarks << line.chomp}
      end
      bookmarks
    end
  end
end
