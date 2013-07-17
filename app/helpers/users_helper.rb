module UsersHelper
  # Returns the Gravatar for the given user.
  # Basic image request URL looks like this:
  # http://www.gravatar.com/avatar/HASH
  # By default, images are presented at 80*80, cusomed by s= or size=
  # http://www.gravatar.com/avatar/HASH?s=40
  # Secure requests served over SSL (HTTPS)
  # https://secure.gravatar.com/avatar/HASH
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
