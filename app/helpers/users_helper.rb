module UsersHelper
  def has_posts?(current_user)
    if current_user.posts.length == 0 
      "#{current_user.name} has not submitted any posts yet."
    end
  end

  def has_comments?(current_user)
    if current_user.comments.length == 0
      "#{current_user.name} has not submitted any comments yet."
    end
  end

  def favorited_posts(current_user)
    if current_user.favorites.length == 0
      "#{current_user.name} has not favorited any posts yet."
    end
  end
end
