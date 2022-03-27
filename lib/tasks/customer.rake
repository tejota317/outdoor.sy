require_relative '../../app/mixins/customer_list_mixin.rb'
namespace :customer do
  include CustomerListMixin
  desc "List customers information from txt file"
  # Example: bundle exec rake customer:list['/home/terence/Downloads/commas.txt',vehicle_name]
  task :list, [:path_to_file, :sort_by] => :environment do |t, args|
    file_path = args[:path_to_file]
    sort_by = args[:sort_by]
    raise ("Must provide a file path!") if file_path.nil?
    customer_array = parse_string_to_customers(file_path)
    customer_array = sort_customers(customer_array, sort_by) unless sort_by.nil?
    customer_array.each{|h| h.each{|k,v| puts "#{k}: #{v}\n"}; puts "*"*50 }
  end
end
