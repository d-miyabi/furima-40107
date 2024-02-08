# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
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
- has_many :purchases

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| name | string | null: false |
| descritption | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user| references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :addresses
- has_one :purchase

## addressesテーブル
| Column | Type | Option |
|-|-|-|
| postal_code | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| house_number | string | null: false |
| building_name | string | null: false |
| phone_number | integer | null: false ||
| user| references | null: false, foreign_key: true |
| purchase | references | null: false, foregin_key: true |

### Association
- belongs_to :purchase

## purchasesテーブル
| Column | Type | Opution |
|-|-|-|
| user_id(FK) | integer | null: false |
| item_id(FK) | integer | null: false |
| quantity | integer | null: false |
| purchased_at | datetime | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address