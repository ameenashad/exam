class AddCategoryIdToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :category_id, :integer, index: true
    # add_column :questions, :category_id, :integer, { :index => true }
    # add_column :questions, :category_id, :integer, index: true
  end
end
