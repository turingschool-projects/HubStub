class AddTicketUrltoItems < ActiveRecord::Migration
  def change
    add_column :items, :ticket_url, :string
  end
end
