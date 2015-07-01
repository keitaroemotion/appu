def exe_dictionary()
  print "[a:]add [d:]delete [m:]modify [q:quit] [Else:]search: "
  oper = $stdin.gets.chomp
  if oper == "q"
    home
  else
    dictionary oper
  end
end

def dictionary(oper)
  case oper
  when "a"
  when "d"
  when "m"
  else
  end
end
