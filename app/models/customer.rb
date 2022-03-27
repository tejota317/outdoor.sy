class Customer
  include ActiveModel::API
  attr_accessor :full_name, :email, :vehicle_type, :vehicle_name, :vehicle_length

  def self.parse_string_to_customers file
    file_str = File.read(file)
    customer_array = file_str.split("\n").map{|str| str.split(/[\|,]/)}.map do |arr|
      Customer.new({full_name: "#{arr[0]} #{arr[1]}",
       email: arr[2],
       vehicle_type: arr[3],
       vehicle_name: arr[4],
       vehicle_length: arr[5] })
    end
  end
end
