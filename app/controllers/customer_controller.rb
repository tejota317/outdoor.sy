require 'byebug'
class CustomerController < ApplicationController

  def index
  end

  def list
    customers = Customer.parse_string_to_customers(params[:customer_list][:file])
    @customers = customers.sort_by{|customer| eval("customer.#{params[:customer_list][:sort]}.downcase")}
  end
end
