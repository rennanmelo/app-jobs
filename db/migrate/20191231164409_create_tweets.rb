class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :user
      t.text :text
      t.string :date
      t.string :url

      t.timestamps
    end
  end
end
