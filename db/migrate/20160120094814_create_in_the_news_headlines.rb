class CreateInTheNewsHeadlines < ActiveRecord::Migration
  def change
    create_table :in_the_news_headlines do |t|
      t.string :headline

      t.timestamps null: false
    end
  end
end
