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

  def user_favorites(current_user)
    if current_user.favorites.length == 0
      "#{current_user.name} has not favorited any posts yet."
    end
  end

  def show_gravatar(user)
    require 'digest/md5'
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    "https://www.gravatar.com/avatar/#{hash}"
  end

end
