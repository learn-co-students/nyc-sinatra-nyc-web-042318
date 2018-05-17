class CreateLandmarkFigureTitleJoinTable < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :year_completed
      t.integer :figure_id
    end

    create_table :figures do |t|
      t.string :name
    end

    create_table :titles do |t|
      t.string :name
    end

    create_table :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end


  end
end
