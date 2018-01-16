class CreateRsaWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :rsa_works do |t|

      t.timestamps
    end
  end
end
