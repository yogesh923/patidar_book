class AddOtherFeildsToUsers < ActiveRecord::Migration[5.0]
  def change
		add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :gender, :string
  	add_column :users, :phone, :string
  	add_column :users, :profession, :string
  	add_column :users, :dob, :date
  	add_column :users, :address, :text
  	add_column :users, :status, :string
    add_column :users, :description_of_profession, :text
    add_column :users, :term_condition, :boolean, default: false
    add_column :users, :profile_details, :jsonb 	
  end
end
