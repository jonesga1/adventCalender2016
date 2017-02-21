require 'digest'

input = "wtnhxymk"

i = 0

password = "-" * 8

while password.include?("-") do
	md5 = Digest::MD5.new
	md5.update input + i.to_s
	result = md5.hexdigest
	password[$1.to_i] = $2 if result =~ /^0{5}([0-7])(.).*/ && password[$1.to_i] == "-"
	i+=1
end
puts password





