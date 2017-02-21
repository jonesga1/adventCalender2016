require 'digest'

$input = "wtnhxymk"

$password = ""
$i = 0

while ($password.length < 8) do
	
	md5 = Digest::MD5.new
	md5.update $input + $i.to_s
	if md5.hexdigest[0..4] == "00000"
		$password << md5.hexdigest[5]
	end
	
	$i += 1

end
puts $password
