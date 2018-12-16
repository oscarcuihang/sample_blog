module BlogService
  class Publisher
    def initialize(published, date, blog)
      @is_published = published
      @date = date || Date.today
      @blog = blog
    end

    def publish
      if @is_published == '1'
        @blog.update(published_date: @date)
      else
        @blog.update(published_date: nil)
      end
    end
  end
end
