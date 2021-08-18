module ApplicationHelper
  def avatar_url(user)
    if user.image && user.provider != 'google_oauth2'
      user.image.concat('&type=large')
    elsif user.provider == 'google_oauth2'
      user.image
    else
      gravatar_id = Digest::MD5.hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?s=150"
    end
  end
end
