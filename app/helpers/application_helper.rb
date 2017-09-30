module ApplicationHelper
	def gravatar_url(user)
		if  user.profile.avatar_url && url?(user.profile.avatar_url).present?
				user.profile.avatar_url 
		else
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"https://gravatar.com/avatar/#{gravatar_id}.png?d=https://cdn.woorkup.com/wp-content/uploads/2016/04/gravatar.png&size=48"
		end
	end



private


def url?(url)

begin
res = Net::HTTP.get_response(URI.parse(url))
	
rescue 
	return ""
end

if res.code.to_i >= 200 && res.code.to_i < 400
	true
else 
	""
end
end

end
