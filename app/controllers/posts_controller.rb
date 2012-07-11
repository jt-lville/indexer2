class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
    
    @preference = current_preference
    @preference.feed_preference = "id" if @preference.feed_preference == nil

    case @preference.feed_preference
    when "id"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    when "name"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'LOWER(name)')
    when "location"
        @posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'location')
    when "cost"
        @posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'cost')
    when "size"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'size')
    when "weight"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'weight')
    when "category"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'category')
    when "owner"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'owner')
    when "manufacturer"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'manufacturer')
    when "date_purchased"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'date_purchased')
    when "purchase_number"
        @posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'purchase_number')
    when "posted_by"
	@posts = Post.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
	#@posts = Post.find(:all).sort!{|p1,p2| p1.user.email <=> p2.user.email}.paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = @post.user if @post.user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


# GET /books/search
# GET /books/search.xml
def search

  @posts = Post.search do
    keywords params[:query]
  end.results

  respond_to do |format|
    format.html { render :action => "index" }
    format.xml  { render :xml => @posts }
  end
end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user = current_user if user_signed_in?

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
