class PostsController < ApplicationController
  before_action :set_organization
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET organizations/1/posts
  def index
    @posts = @organization.posts
  end

  # GET organizations/1/posts/1
  def show
  end

  # GET organizations/1/posts/new
  def new
    @post = @organization.posts.build
  end

  # GET organizations/1/posts/1/edit
  def edit
  end

  # POST organizations/1/posts
  def create
    @post = @organization.posts.build(post_params)

    if @post.save
      redirect_to([@post.organization, @post], notice: 'Post was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT organizations/1/posts/1
  def update
    if @post.update_attributes(post_params)
      redirect_to([@post.organization, @post], notice: 'Post was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE organizations/1/posts/1
  def destroy
    @post.destroy

    redirect_to organization_posts_url(@organization)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
      s3_service.set_bucket(@organization.bucket_name)
    end

    def set_post
      @post = @organization.posts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :description, :featured_image)
    end
end
