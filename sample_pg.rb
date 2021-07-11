require 'pg'
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result = connection.exec("select quality, give_for from crops
    where quality = false and give_for != '自家消費'")
  result.each do |record|
    puts "ゴーヤの品質：#{record["quality"]} 売った相手：#{record["give_for"]}"
  end
ensure
  connection.finish
end
