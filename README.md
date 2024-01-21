#　テーブル設計

# usersテーブル
|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |
|last_name          |string    |null: false               |
|first_name         |string    |null: false               |
|last_name_kana     |string    |null: false               |
|first_name_kana    |string    |null: false               |
|birthday           |date      |null: false               |

## Association
- has_many :items
- has_many :buys



# itemsテーブル
|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|name                |string     |null: false                     |
|comment             |text       |null: false                     |
|category_id         |integer    |null: false                     |
|condition_id        |integer    |null: false                     |
|delivery_charge_id  |integer    |null: false                     |
|prefecture_id       |integer    |null: false                     |
|day_required_id     |integer    |null: false                     |
|price               |integer    |null: false                     |
|user                |references |null: false, foreign_key: true  |

## Association
- belongs_to :user
- has_one :buy


# buysテーブル
|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|user                  |references |null: false, foreign_key: true |
|item                  |references |null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_information


# shipping_informationsテーブル
|Column          |Type      |Options                         |
|----------------|----------|--------------------------------|
|postcode        |string    |null: false                     |
|prefecture_id   |integer   |null: false                     |
|municipalities  |string    |null: false                     |
|block           |integer   |null: false                     |
|building        |string    |null: false                     |
|phone_number    |integer   |null: false                     |
|buy             |references|null: false, foreign_key: true  |

## Association
- belongs_to :buy


