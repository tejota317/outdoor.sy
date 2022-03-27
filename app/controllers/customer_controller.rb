
class CustomerController < ApplicationController
  include CustomerListMixin
  def index
  end

  def list
    customers = parse_string_to_customers(params[:customer_list][:file])
    @customers = sort_customers(customers, params[:customer_list][:sort])
  end
end
