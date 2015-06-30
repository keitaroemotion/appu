 def handle_exception(e)
   puts
   puts "------------------------------".red
   puts "ERROR #{e}".red
   stack = Array.new
   e.backtrace.inspect.split(',').each do |elem|
     stack.push elem.gsub("\"","").gsub("[","").gsub("]","")
   end
   big_arr = Array.new
   sb1 = 0
   sb2 = 0
   sb3 = 0
   def ret_maxsize(currmax, text)
     if text.size > currmax
        return text.size
     end
     return currmax
   end
   def show_err_content(modulename, line)
     line = line.strip.to_i
     if (modulename != nil) && (modulename != "")
       module_exists = File.exist? "#{$target_lib}/#{modulename}"
       main_exists = File.exist? "#{$target_bin}/#{modulename}"
       if module_exists
         print file_to_array("#{$target_lib}/#{modulename}")[line-1].strip.yellow
       end
       if main_exists
         print file_to_array("#{$target_bin}/#{modulename}")[line-1].strip.yellow
       end
     end
   end



   stack.reverse.each do |s|
     arr = Array.new  # sb=split by
     sb_in = s.strip.chomp.split(":in")

     yon = sb_in[sb_in.size-1].gsub('`','').gsub('\'','').strip
     arr.push yon
     sb1 = ret_maxsize sb1, yon

     sb_semicolon = sb_in[0].split(":")

     sb2 = ret_maxsize sb2, sb_semicolon[1]
     arr.push sb_semicolon[1]

     sb_slash = sb_semicolon[0].split('/')
     sb3 = ret_maxsize sb3, sb_slash[sb_slash.size-1]
     arr.push sb_slash[sb_slash.size-1]
     big_arr.push arr
   end

   def square_bracket(text, mxs)
     print "["
     print text.green
     (1..mxs-text.size).each do |s|
       print " "
     end
     print "] "
   end
   big_arr.each do |arr|
     square_bracket arr[0], sb1
     print "line:"
     square_bracket arr[1], sb2
     square_bracket arr[2], sb3
     show_err_content  arr[2], arr[1]
     puts
   end
   puts "------------------------------".red
   puts
end

