# README
usersテーブル

| Column                          | Type       | Options      |
| ------------------------------- | ---------- | ------------ |
| name                            | string     | null: false  |名前
| email                           | string     | null: false  |メールアドレス
| encrypted_password              | string     | null: false  |パスワード
| full_width_last_name            | string     | null: false  |姓
| full_width_first_name           | string     | null: false  |名
| kana_last_name                  | string     | null: false  |カタカナ姓
| kana_first_name                 | string     | null: false  |カタカナ名
| birthday                        | date       | null: false  |誕生日

### Association
- has_many :items
- has_many :personals

itemsテーブル

| Column               | Type       | Options                        |
| ---------------------| ------     | -------------------------------|
| product_name         | string     | null: false                    |商品名
| category_id          | integer    | null: false                    |カテゴリー
| price             　　| integer    | null: false                    |値段
| product_description  | text       | null: false                    |商品説明
| product_condition_id | integer    | null: false                    |商品の状態
| shipping_charges_id  | integer    | null: false                    |配送料の負担
| delivery_area_id     | integer    | null: false                    |配送先地域
| data_of_shipment_id  | integer    | null: false                    |発送までの日付
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :personal

personalsテーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one    :serect

serectsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |郵便番号
| prefectures_id  | integer    | null: false                    |都道府県
| municipality    | string     | null: false                    |市区町村
| address         | string     | null: false                    |番地
| building_name   | string     |                                |建物名
| phone number    | string     | null: false                    |電話番号
| personal        | references | null: false, foreign_key: true |

### Association
- belongs_to :personal