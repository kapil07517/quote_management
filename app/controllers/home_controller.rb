class HomeController < ApplicationController
  def index
  # 	dynamo_db = Aws::DynamoDB::Client.new
		# dynamo_db.create_table(
  #     :table_name => "exp_managements_1",
  #   	:attribute_definitions => [
  #     	{
  #       	:attribute_name => :Id,
  #       	:attribute_type => :N
  #     	}
  #   	],
  #   	:key_schema => [
  #     	{
  #       	:attribute_name => :Id,
  #       	:key_type => :HASH
  #     	}
  #   	],
  #   	:provisioned_throughput => {
  #     	:read_capacity_units => 1,
  #     	:write_capacity_units => 1,
  #   	}
  # 	)
  end
end
