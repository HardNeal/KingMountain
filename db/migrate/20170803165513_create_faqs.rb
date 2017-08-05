class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
