module BlogsHelper
  def display_edit_button(blog)
    return unless blog.user == current_user
    link_to(
      'Edit',
      edit_blog_path(blog),
      class: 'btn btn-warning'
    )
  end

  def display_delete_button(blog)
    return unless blog.user == current_user
    link_to(
      'Delete',
      blog,
      method: :delete,
      class: 'btn btn-danger',
      data: { confirm: 'Are you sure?' }
    )
  end

  def display_new_blog_button
    return unless current_user
    link_to(
      'New Blog',
      new_blog_path,
      class: 'btn btn-primary',
    )
  end

  def display_my_blogs_button
    return unless current_user
    link_to(
      'My Blogs',
      blogs_path(user_blogs: true),
      class: 'btn btn-primary',
    )
  end

  def display_sub_title(blog)
    return unless blog
    return 'Unpublished' if blog.published_date.nil?
    "#{blog.published_date.strftime} by #{blog.user.name}"
  end

  def display_published_date(date)
    return 'Unpublished' unless date
    date.strftime
  end
end
