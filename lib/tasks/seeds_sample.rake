namespace :seeds_sample do

  # desc "実行処理の説明"
  # task :sample do
  #   puts "Hello World"
  # end

  # Dir.glob('**/*') do |d| //ディレクトリ一覧の表示
  #   puts d
  # end
  # File.join //パスの結合
  # File.basename("hogehoge.rb", '.*') #=> "hogehoge" //ファイル名の取得
  # File.extname("hogehoge.rb") #=> ".rb" //ファイル拡張子の取得
  # .gsub("置換前", "置換後")

  Dir.glob(File.join(Rails.root, 'db', 'seeds', '*.rb')).each do |file|
    desc "Load the seed data from db/seeds/#{File.basename(file)}."
    task "db:seed:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
      load(file)
    end
  end


end
