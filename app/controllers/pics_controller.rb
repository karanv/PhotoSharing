class PicsController < ApplicationController
  def users
	@users = User.all
	  respond_to do |format|
		  format.html #users.html.erb
		  format.json {render json: @users}
	  end
	
  end

  def user 
	@user = User.find(params[:id])
	@users = User.all
	@photos = Photo.all 
	@comments = Comment.all
	@tags = Tag.all
	
	respond_to do |format|
		format.html # user.html.erb
		format.json {render json: @post }
	end
  end
  
  def comment
    @photo = Photo.find(params[:id])
  end
  
  def post_comment
    @photo = Photo.find(params[:id])
    @comment = Comment.new(params[:thisComment])
    if (@comment.save)
      redirect_to("/pics/user/#{@photo.user_id}")
    else
      flash[:notice] = "Comment Field cannot be empty!"
      redirect_to("/pics/comment/#{@photo.id}")
    end
  end
  
  def photo
    
  end 
  
  def post_photo
      uploaded_io = params[:thisPhoto][:picture]
      File.open(Rails.root.join('public', 'images', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      puts params[:thisPhoto]
      @photo = Photo.new
      @photo.file_name = uploaded_io.original_filename
      @photo.user_id = session[:logged_in]
      @photo.date_time = Time.now.utc  
      @photo.save		
      redirect_to("/pics/user/#{@photo.user_id}")
  end
  
  def post_tag
      puts params[:tag]
      @tag = Tag.new(params[:tag])
      @thephoto = Photo.find(params[:tag][:photo_id])
      if (@tag.save)
        redirect_to("/pics/user/#{@thephoto.user_id}/##{@thephoto.id}")
        puts "tag save successful"
      else
        puts "there were some errors saving the tag"
      end      
  end
  
  def search
        @substr = params[:substring]
        @matchingPics = Photo.findPics(@substr) 
        render :partial =>"find_photos" ,:locals => {:substring => @substr, :matchingPics => @matchingPics}
  end
  
end
