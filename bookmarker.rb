class Bookmarker
  def show_help_msg
    msg = <<-END_OF_MSG
Usage: cdb [-c|-g|-d|-l] [bookmark]
-c: create bookmark
-g: goto bookmark
-d: delete bookmark
-l: list bookmarks'
    END_OF_MSG
    msg
  end
end
