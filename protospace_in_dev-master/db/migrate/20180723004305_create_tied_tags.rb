class CreateTiedTags < ActiveRecord::Migration
  def change
    create_table :tied_tags do |t|
      t.references :prototype
      t.references :tag
      t.timestamps null: false
    end
    add_index :tied_tags, :prototype_id
    add_index :tied_tags, :tag_id
    add_index :tied_tags, [:prototype_id,:tag_id],unique: true
  end
end
