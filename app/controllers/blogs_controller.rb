class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs =
      if current_user && params[:user_blogs].present?
        Blog.where(user: current_user)
      else
        Blog.search(search_param[:term])
      end
  end

  def show
    BlogService::ViewCounter.new.plus(@blog)
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    redirect_to @blog, notice: 'Login required before create new blog' if current_user.nil?
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if @blog.save!
      BlogService::Publisher.new(blog_params[:published], blog_params[:published_date], @blog).publish
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      BlogService::Publisher.new(blog_params[:published], blog_params[:published_date], @blog).publish
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  def set_blog
    @blog = Blog.find_by(id: params[:id])
    redirect_to blogs_url, notice: 'Blog not found' if @blog.nil?
  end

  def search_param
    params.permit(:term)
  end

  def blog_params
    params.fetch(:blog, {}).permit(:title, :published, :content, :published_date)
  end
end
