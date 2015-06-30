def exe_memo()
  f = File.open($target_memo, "a")
  f.puts "hi"
  f.close
end
