require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp

  #getsとreadlinesとreadが使える
  #STDINは標準入力　参考資料：https://www.sejuku.net/blog/14078
  puts "メモの内容を書いてください。【終了はcontrol + D】"
  #STDIN.read のところが readlines にしたらエラーになる
  memo_content = STDIN.read
  memo = memo_content.chomp

elsif memo_type == 2
  puts "編集したいファイル（拡張子を除いた）を入力してください"
  file_edit = gets.chomp
  puts "メモの追加内容を書いてください。【終了はcontrol + D】"
  memo_content = STDIN.read
  memo = memo_content.chomp

end

CSV.open("#{file_name}.csv", "w" ) do |csv|
  csv << ["#{memo}"]
end

CSV.open("#{file_edit}.csv", "a") do |csv|
  csv << ["#{memo}"]
end

