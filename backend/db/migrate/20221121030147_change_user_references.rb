class ChangeUserReferences < ActiveRecord::Migration[7.0]
  def change
    change_table :artists do |t|
      change_column_null :artists, :user_id, true
    end
  end
end
