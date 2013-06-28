class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down
    jb = User.new(:first_name => "Justin", :last_name => "Bieber")
    jb.save(:validate => false)
    ph = User.new(:first_name => "Paris",  :last_name => "Hilton")
    ph.save(:validate => false)
    bh = User.new(:first_name => "Barack", :last_name => "Obama")
    bh.save(:validate => false)
    sc = User.new(:first_name => "Santa", :last_name => "Claus")
    sc.save(:validate => false)
    jo = User.new(:first_name => "John", :last_name => "Ousterhout")
    jo.save(:validate => false)
    funny = User.new(:first_name => "<Funny>", :last_name => "&lt;name")
    funny.save(:validate => false)
    
    # Create initial photos.
    photo1 = Photo.new(:date_time => "2009-08-30 10:44:23",
        :file_name => "ouster.jpg")
    photo1.user = jo
    photo1.save(:validate => false)
    
    photo2 = Photo.new(:date_time => "2010-09-13 20:00:00",
        :file_name => "bieber1.jpg")
    photo2.user = jb
    photo2.save(:validate => false)
    photo3 = Photo.new(:date_time => "2010-09-13 20:05:03",
        :file_name => "bieber2.jpg")
    photo3.user = jb
    photo3.save(:validate => false)

    photo4 = Photo.new(:date_time => "2009-11-18 18:02:00",
        :file_name => "hilton1.jpg")
    photo4.user = ph
    photo4.save(:validate => false)
    photo5 = Photo.new(:date_time => "2009-09-20 17:30:00",
        :file_name => "hilton2.jpg")
    photo5.user = ph
    photo5.save(:validate => false)

    photo6 = Photo.new(:date_time => "2009-07-10 16:02:49",
        :file_name => "obama1.jpg")
    photo6.user = bh
    photo6.save(:validate => false)
    photo7 = Photo.new(:date_time => "2010-03-18 23:48:00",
        :file_name => "obama2.jpg")
    photo7.user = bh
    photo7.save(:validate => false)
    photo8 = Photo.new(:date_time => "2010-08-30 14:26:00",
        :file_name => "obama3.jpg")
    photo8.user = bh
    photo8.save(:validate => false)
    
    photo9 = Photo.new(:date_time => "2010-09-04 09:16:32",
        :file_name => "santa1.jpg")
    photo9.user = sc
    photo9.save(:validate => false)
    
    # Create initial comments.
    comment = Comment.new(:date_time => "2009-09-02 14:01:00",
        :comment => "Learning new programming languages is hard...")
    comment.user = jo
    comment.photo = photo1
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2009-09-02 14:02:00",
        :comment => "This is another comment, with a bit more text; " +
        "if the text gets long enough, does it wrap properly " +
        "from line to line?")
    comment.user = jo
    comment.photo = photo1
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2009-09-02 14:06:00",
        :comment => "If you see this text in <b>boldface</b> " +
        "then HTML escaping isn't working properly.")
    comment.user = jo
    comment.photo = photo1
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2010-09-14 18:07:00",
        :comment => "No guys, she is *not* my mom.  She's my date.")
    comment.user = jb
    comment.photo = photo2
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2010-02-28 17:45:13",
        :comment => "I came up with lots of comments for this photo, " +
        "but unfortunately none of them are printable.")
    comment.user = jo
    comment.photo = photo5
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2010-09-02 14:07:00",
        :comment => "Hey Barack, great form! Do u s'pose u could " +
        "give me n Lindsay some bowling tips? xxoo Paris")
    comment.user = ph
    comment.photo = photo7
    comment.save(:validate => false)
    comment = Comment.new(:date_time => "2010-09-02 14:07:00",
        :comment => "Sorry Paris, but no can do; my poll numbers " +
        "are already bad enough...")
    comment.user = bh
    comment.photo = photo7
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2010-09-06 13:59:33",
        :comment => "We're off to a Justin Bieber concert")
    comment.user = bh
    comment.photo = photo8
    comment.save(:validate => false)
    
    comment = Comment.new(:date_time => "2010-09-04 10:14:32",
        :comment => "I'm going to be watching how well you do in CS 142!")
    comment.user = sc
    comment.photo = photo9
    comment.save(:validate => false)
  end

  def down
      Comment.delete_all
      Photo.delete_all
      User.delete_all
  end
end
