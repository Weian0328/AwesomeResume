class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :resume, null: false, foreign_key: true
      t.text :content
      t.datetime :deleted_at, index:true

      t.timestamps
    end
  end
end