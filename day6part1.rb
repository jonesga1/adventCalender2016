file = File.new("day6text.txt", "r")
lineValues = []
col1 = []
col2 = []
col3 = []
col4 = []
col5 = []
col6 = []
col7 = []
col8 = []
while line = file.gets do
	line.length.times do |n|
		lineValues.push(line[n])
	end
	col1.push(lineValues[0])
	col2.push(lineValues[1])
	col3.push(lineValues[2])
	col4.push(lineValues[3])
	col5.push(lineValues[4])
	col6.push(lineValues[5])
	col7.push(lineValues[6])
	col8.push(lineValues[7])
	lineValues = []
end

puts col1.max_by{|x| col1.count(x) }
puts col2.max_by{|x| col2.count(x) }
puts col3.max_by{|x| col3.count(x) }
puts col4.max_by{|x| col4.count(x) }
puts col5.max_by{|x| col5.count(x) }
puts col6.max_by{|x| col6.count(x) }
puts col7.max_by{|x| col7.count(x) }
puts col8.max_by{|x| col8.count(x) }

#ugly code I'm sorry ;-;
file.close