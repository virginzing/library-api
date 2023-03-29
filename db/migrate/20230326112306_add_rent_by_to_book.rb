class AddRentByToBook < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :rent_by, references: :users
  end
end
