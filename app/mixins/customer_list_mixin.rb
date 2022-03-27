module CustomerListMixin
  def parse_string_to_customers file
    file_str = File.read(file)
    customer_array = file_str.split("\n").map{|str| str.split(/[\|,]/)}.map do |arr|
      {full_name: "#{arr[0]} #{arr[1]}",
       email: arr[2],
       vehicle_type: arr[3],
       vehicle_name: arr[4],
       vehicle_length: arr[5] }
    end
  end

  def sort_customers customers, sort_by
    sort_by = sort_by.to_sym
    customers.sort_by{|h| h[sort_by].downcase}
  end
end
