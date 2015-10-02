class CreateAlAssociations < ActiveRecord::Migration
  def change
    create_table(:al_associations, :id => false) do |t|
      t.integer :action_page_id
      t.integer :location_id
    end
    
    add_index(:al_associations, [ :action_page_id, :location_id ])
  end
end
