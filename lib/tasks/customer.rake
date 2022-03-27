namespace :customer do
  desc "List customers information from txt file"
  # Example: bundle exec rake customer:list['/home/terence/Downloads/commas.txt',vehicle_name]
  task :list, [:path_to_file, :sort_by] => :environment do |t, args|
    file_path = args[:path_to_file]
    sort_by = args[:sort_by]
    raise ("Must provide a file path!") if file_path.nil?
    file_str = File.read(file_path)
    customer_array = file_str.split("\n").map{|str| str.split(/[\|,]/)}.map do |arr|
      {full_name: "#{arr[0]} #{arr[1]}",
       email: arr[2],
       vehicle_type: arr[3],
       vehicle_name: arr[4],
       vehicle_length: arr[5] }
    end
    customer_array = customer_array.sort_by{|h| h[sort_by.to_sym].downcase} unless sort_by.nil?
    customer_array.each{|h| h.each{|k,v| puts "#{k}: #{v}\n"}; puts "*"*50 }
  end
end
