class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :subject
      t.string     'name'
      t.string     'permalink'
      t.integer    'position'
      t.boolean    'visible',   :default => false
      t.timestamps
    end
    change_table :pages do |t|
      t.index 'subject_id'
      t.index 'position'
      t.index 'permalink'
    end
  end

  def self.down
    remove_index :pages, 'subject_id'
    remove_index :pages, 'position'
    remove_index :pages, 'permalink'
    drop_table :pages
  end
end
