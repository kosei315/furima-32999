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
- has_many :personal

itemsテーブル

| Column               | Type       | Options                        |
| ---------------------| ------     | -------------------------------|
| product_name         | string     | null: false                    |商品名
| category_id          | integer    | null: false                    |カテゴリー
| price                | string     | null: false                    |値段
| seller               | string     | null: false                    |出品者
| photo                | text       | null: false                    |写真
| product_description  | text       | null: false                    |商品説明
| product_condition_id | integer    | null: false                    |商品の状態
| shipping_charges_id  | integer    | null: false                    |配送料の負担
| delivery_area_id     | integer    | null: false                    |配送先地域
| deta_of_shipment_id  | integer    | null: false                    |発送までの日付
| user_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :personal

personalテーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one    :serect

serectテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card            | string     | null: false                    |クレカ
| expiration_date | string     | null: false                    |有効期限
| security_code   | string     | null: false                    |セキュリティコード
| Postal_code     | string     | null: false                    |郵便番号
| prefectures     | integer    | null: false                    |都道府県
| Municipality    | string     | null: false                    |市区町村
| address         | string     | null: false                    |番地
| Building_name   | string     | null: true                     |建物名
| phone number    | string     | null: false                    |電話番号
| items_id        | references | null: false, foreign_key: true |
| personal_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :personal