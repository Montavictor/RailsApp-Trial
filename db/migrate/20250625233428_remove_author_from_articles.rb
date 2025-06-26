class RemoveAuthorFromArticles < ActiveRecord::Migration[7.2]
  def change
    remove_column :articles, :author, :string
  end
end
