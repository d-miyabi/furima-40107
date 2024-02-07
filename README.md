# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| date_of_birth | date | null: false |

### Association
- has_many :items
- has_many :addresses
- has_many :purchases

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| descritption | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :addresses
- has_many :purchases

## addressesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| postal_code | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| house_number | string | null: false |
| building_name | string | null: false |
| phone_number | integer | null: false ||
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one :purchases

## purchasesテーブル
| Column | Type | Opution |
|-|-|-|
| id(PK) | integer | null: false |
| user_id(FK) | integer | null: false |
| item_id(FK) | integer | null: false |
| quantity | integer | null: false |
| status | string | null: false |
| purchased_at | string | null: false |

### Association
- belongs_to :user
- belongs_to :items
- has_one :address