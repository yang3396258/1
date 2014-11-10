class CreateBooks < ActiveRecord::Migration
  
  def change
    create_table :books do |t|
      t.string :number, null: false     # Isbn番号
      t.string :name, null: false        # 書名
      t.string :full_name                # 著作者
      t.string :publisher_name           # 出版社
      t.integer :price                   # 価格 
      t.string :place                    # 置いた場所
      
      t.string :kari_name                # 借り者
      t.string :kari_place             # 借りた場合置いた場所
      t.string :kari_email             # 借りた場合借り者メールアドレス
      t.boolean :borrowed              #借りるか？
      t.timestamps
    end
  end
end