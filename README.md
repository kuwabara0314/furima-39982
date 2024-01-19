#　テーブル設計

# usersテーブル
|Column           |Type      |Options                  |
|-----------------|----------|-------------------------|
|nickname         |string    |null: false              |
|email            |string    |null: false              |
|password         |string    |null: false              |
|last_name        |string    |null: false              |
|first_name       |string    |null: false              |
|last_name_kana   |string    |null: false              |
|first_name_kana  |string    |null: false              |
|birthday         |date      |null: false              |

## Association
- has_many :items
- has_many :user_buys
- has_many :buys, through: :user_buys



# itemsテーブル
|Column           |Type      |Options                  |
|-----------------|----------|-------------------------|
|image            |text      |null: false              |
|name             |string    |null: false              |
|comment          |text      |null: false              |
|category         |string    |null: false              |
|condition        |string    |null: false              |
|delivery_charge  |string    |null: false              |
|region           |string    |null: false              |
|day_required     |integer   |null: false              |
|price            |integer   |null: false              |

## Association
- belongs_to :user
- belongs_to :buy


# buysテーブル
|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|user                  |references |null: false, foreign_key: true |
|item                  |references |null: false, foreign_key: true |
|shipping_information  |references |null: false, foreign_key: true |

## Association

- has_many :items
- belongs_to :shipping_information
- has_many :user_buys
- has_many :users, through: :user_buys



# shipping_informationsテーブル
|Column          |Type      |Options                  |
|----------------|----------|-------------------------|
|address         |integer   |null: false              |
|postcode        |integer   |null: false              |
|prefecture      |string    |null: false              |
|municipalities  |string    |null: false              |
|block           |integer   |null: false              |
|building        |string    |null: false              |
|phone_number    |integer   |null: false              |

## Association
- has_one :buys


# user_buysテーブル
|Column       |Type        |Options                         |
|-------------|------------|--------------------------------|
|user         |references  |null: false, foreign_key: true  |
|buy          |references  |null: false, foreign_key: true  |

## Association
- belongs_to :user
- belongs_to :buy