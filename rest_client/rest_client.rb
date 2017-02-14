require 'rest-client'

print "This is a google search tool, enter your search query here: "
input = gets.chomp.gsub(' ', '+')
response = RestClient.get("https://www.google.com/#q=#{input}")

puts %Q{
	Response code:\n
	#{response.code}\n
	Response cookies:\n
	#{response.cookies}\n
	Response headers:\n
	#{response.headers}\n
	Response body:\n
	#{response.body}
}