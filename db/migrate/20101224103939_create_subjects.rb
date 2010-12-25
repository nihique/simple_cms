class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string  'name'
      t.integer 'position'
      t.boolean 'visible', :default => false
      t.timestamps
    end
    add_index :subjects, 'position'
  end

  def self.down
    remove_index :subjects, 'position'
    drop_table   :subjects
  end
end
