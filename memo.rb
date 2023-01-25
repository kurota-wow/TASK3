require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
 
 # if文を使用して続きを作成していきましょう。
 # 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    title = gets.chomp
    title_name = "#{title}.csv"
    puts "メモの内容を入力してください"
    puts "完了したらCtrl＋Dを押してください"
    memo = STDIN.read
    
    CSV.open( title_name ,'w', :quote_char => '') do |csv|
        csv << ["#{memo}"]
    end
elsif memo_type == 2
    puts "現在作っているメモ一覧"
    Dir.glob("*.csv") do |item|
        puts item
    end
    puts "編集したいメモの拡張子を除いたファイル名を入力してください"
    title = gets.chomp
    title_name = "#{title}.csv"
    
    begin 
        p CSV.read(title_name)
    rescue 
        puts "存在するファイル名を入力してください"
        exit
    end
    
    
    puts "1 → メモを追記する / 2 → メモを上書きする"
    edit_type = gets.to_i
    puts "内容を入力して、完了したらCtrl＋Dを押してください"
    if edit_type == 1
        memo = STDIN.read
        CSV.open(title_name ,'a', :quote_char => '') do |csv|
            csv << ["#{memo}"]
        end
    elsif edit_type == 2
        memo = STDIN.read
        CSV.open(title_name ,'w', :quote_char => '') do |csv|
            csv << ["#{memo}"]
        end
    else
        puts "1か2を入力してください"
    end
    
else
    puts "1か2を入力してください"
end

