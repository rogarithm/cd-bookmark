module Cdb
  class Bookmarker
    attr_accessor :bookmark_db

    def initialize
      @bookmark_db="/Users/sehun/tools/cdb/.cd_bookmarks"
    end

    def add_bookmark(name, path)
      if exists?(name) == true
        raise ArgumentError, "Failed to add #{path} as #{name}: #{$!}"
      end
      file = File.open(@bookmark_db, "a")
      file.puts("#{name}:#{path}\n")
      file.close
    end

    def exists?(name)
      matching = self.list_bookmarks.grep(/^#{name}:/)
      matching.count == 1
    end

    def remove_bookmark(name)
      if name.nil? or name.empty?
        raise ArgumentError, "Failed to delete bookmark. Please specify value for name parameter: #{$!}"
      end

      if exists?(name) == false
        raise ArgumentError, "Failed to delete bookmark. Couldn't find bookmark for given name: #{$!}"
      end
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
