def swap_contents(file1, file2)

  tempfile = File.new("temp.txt", "w")
  File.open(file2, "r").each_char {|char| tempfile.write char}
  tempfile.close

  filename2 = File.open(file2, "w")
  File.open(file1, "r").each_char {|char| filename2.write char}
  filename2.close  

  filename1 = File.open(file1, "w")
  File.open(tempfile, "r").each_char {|char| filename1.write char}
  filename1.close  
  File.delete("temp.txt")
end

if ARGV[0] && ARGV[1]
  if File.exist?(ARGV[0]) && File.exist?(ARGV[1])
    swap_contents(ARGV[0], ARGV[1])
  else
  puts "Filenames not found"
  end
else
  puts "Swap contents of files."
  puts "usage: #{$0} <1st file> <2nd file>"
end
