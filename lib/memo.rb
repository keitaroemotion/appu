def exe_memo()
  # read root memo directory from config file
  #
  alt_document_dir
=begin
  print "[memo]> "
  f = File.open($target_memo, "a")
  #date[yyyy/MM/dd] content
  t = Time.now
  f.puts "#{t.year}-#{t.month}-#{t.day},#{$stdin.gets.chomp}"
  f.close
=end
end

def alt_document_dir()
  f = File.open($target_memo, "w") # config file
  print "Enter the document root directory: "
  docrootdir = $stdin.gets.chomp.strip

  if docrootdir == "~"
     docrootdir = %x(home)
  end

  if File.directory? docrootdir
    f.puts "#{docrootdir}"
  elsif docrootdir == "q"

  else
    puts "Directory #{docrootdir} doesn't exist...".red
    alt_document_dir
  end
  f.close
end
