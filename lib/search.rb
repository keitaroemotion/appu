def exe_search()
  search_terms = get_args "Enter keywords:"
  numero = 0

  require 'open-uri'
  lc = 0.0
  data = Array.new
  File.open($target_file, "r").each do |line|
   data.push line
   lc += 1
  end
  puts

  progress = 0.0
  bar_max = 60.0
  print "seaching ...".green

  s = 0.0 #total stack

  data.each do |line|
    link =  line.split(',')[0]
    #print "seaching ...".green
    #print " #{link[0..30]}..".cyan
    print "#{((bar_max * progress/lc) - s)}\r"
    if ((bar_max * progress/lc) - s) < 0
      print "="
      s += 1
    end

    #print "\r"
    contents = open(link).read

    def term_matches(search_terms, contents)
      search_terms.each do |term|
        if contents.include?(term) == false
          return false
        end
      end
      return true
    end

    if term_matches(search_terms, contents) == true
      system("open #{link}")
      numero = numero+1
    end
    progress += 1
  end
  puts
  if numero == 1
    puts "1 page have been found.".yellow
  else
    puts "#{numero} pages have been found.".yellow
  end
  puts
end

