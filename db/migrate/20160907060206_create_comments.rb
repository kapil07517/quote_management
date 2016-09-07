class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.integer :commentable_id
    	t.integer :commentor_id
    	t.text :comment
    	t.string :commentable_type

      t.timestamps
    end
  end
end
