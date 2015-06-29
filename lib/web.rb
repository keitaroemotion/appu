def exe_web()
  url = "https://www.google.co.jp/search?q="
  get_args("Enter search words:").each do |word|
    url += "#{word}+"
  end
  system "open #{url[0 .. url.size-2]}"
end

