module BlogService
  class ViewCounter
    def plus(blog)
      blog.view_count = blog.view_count + 1
      blog.save!
    end
  end
end
