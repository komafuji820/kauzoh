# アプリケーション名
  Kauzoh（お買い物リスト共有アプリ）

# アプリケーション概要
  - 家族や友人間でお買い物リストを共有できます。
  - 家にあるもの（在庫）を登録しておくことで、数クリックでお買い物リストを作ることができます。
  - リストを共有したくないときは、自分専用のお買い物リストを作ることもできます。

# URL
  https://kauzoh.onrender.com

# テスト用アカウント
  - Basic認証のユーザー名 admin
  - Basic認証のパスワード noah1015
  - テスト用ユーザー
    - ニックネーム：花子 メールアドレス：hanako@test.com パスワード：111aaa
    - ニックネーム：太郎 メールアドレス：taro@test.com   パスワード：222bbb

# 利用方法

### グループの作成
  1. ヘッダーの"ユーザーとグループを作成"をクリックすると、ほかのユーザーを検索できます。
  [![Image from Gyazo](https://i.gyazo.com/7e59c5e8abb1073b9235f303f1c02453.gif)](https://gyazo.com/7e59c5e8abb1073b9235f303f1c02453)
  2. 検索結果からグループに誘うユーザーを選んでグループ名を入力すると、グループを作成できます。
  [![Image from Gyazo](https://i.gyazo.com/bff748f945f28f42df975b70c246935b.gif)](https://gyazo.com/bff748f945f28f42df975b70c246935b)

  - 複数のユーザーを続けて検索することもできます。
  [![Image from Gyazo](https://i.gyazo.com/19f5ccaabab6178e4365756a016033fd.gif)](https://gyazo.com/19f5ccaabab6178e4365756a016033fd)

  3. 自分専用のお買い物リストを作成したいときは、"自分1人のグループを作成"からグループを作成します。

### 在庫登録
  1. グループリストからグループを選び、"在庫リスト"→"在庫を登録する"の順に進みます。
  2. カテゴリを入力後、メモまたは画像を投稿すると、在庫を登録できます。
  [![Image from Gyazo](https://i.gyazo.com/395c61a7c9b926bdbb7752baf5bc886a.gif)](https://gyazo.com/395c61a7c9b926bdbb7752baf5bc886a)


### お買い物リスト登録
  - 在庫リストから登録する場合
    1. グループリストからグループを選び、"お買い物リスト"→"お買い物リスト登録"の順に進みます。
    2. 登録画面にある"在庫から選ぶときはこちら"をクリックします。
    3. 在庫リストの中にある"お買い物リストに登録"をクリックします。なお、グループから直接"在庫リスト"をクリックし、"お買い物リストに登録"に進むこともできます。
    4. 優先度を入力し、メモ（任意）を入力すると、お買い物リストを登録できます。カテゴリ・写真は在庫リストのものが自動で反映されます。
    [![Image from Gyazo](https://i.gyazo.com/588d07c91eed78e8c26cec0dbe50ff23.gif)](https://gyazo.com/588d07c91eed78e8c26cec0dbe50ff23)

  - 在庫にないものを登録する場合
    1. グループリストからグループを選び、"お買い物リスト"→"お買い物リスト登録"の順に進みます。
    2. カテゴリ・優先度を入力後、メモまたは画像を投稿すると、お買い物リストを登録できます。

### 単価比較機能
  1. グループリストからグループを選び、"お買い物リスト"→"単価を比較する"の順に進みます。
  2. 商品の価格と数量を入力すると、単価が表示されます。最大5つまで同時に比較できます。
  [![Image from Gyazo](https://i.gyazo.com/567b600190f7ff8795a2156f2633f277.gif)](https://gyazo.com/567b600190f7ff8795a2156f2633f277)

### 購入済み商品のチェック機能・一括削除機能
- 買い物中は、買った商品にチェックを入れていくことができます。買い物が終わったら買い物完了ボタンを押せば、一括削除ができます。
[![Image from Gyazo](https://i.gyazo.com/fe490b7e96274944a955fd93dc5f4875.gif)](https://gyazo.com/fe490b7e96274944a955fd93dc5f4875)

# アプリケーションを作成した背景
  次のとおりペルソナを設定し、課題と解決策を洗い出しました。
## ペルソナ
  - 性別：女性
  - 年齢：40代
  - 家族構成：夫と二人暮らし
  - 仕事：事務職
  - 買い物の頻度：ほぼ毎日。仕事終わりに買い物をする。たまに夫に買い物を頼むことがある。

## 感じている課題
  1. 買い物リストの入力が面倒
  2. 文字だけでは伝えきれないことがある。例えば…
  - 似たような商品パッケージがあったりデザインが変わったりすると、いつも買っているものがどれか迷う
  - 似たような理由で、買い物を頼まれた夫も、普段買っているものがどれかが分からない
  3. いざ買い物に来た時に、「家にあったっけ？」と考えることがある
  4. 物価高なので、単価が一番安いものを買いたい。スマホの電卓では、前の計算結果を覚えないと比較ができない

## 考えた解決策（それぞれ1~4の課題に対応）
  1. より少ない手間でお買い物リストを作成できるようにすること。具体的には3の通り。
  2. お買い物リストに写真投稿機能を実装すること。また、それを共有できるようにグループ機能を実装すること。
  3. 家にあるものを在庫として登録できる機能を実装すること。そして、在庫からお買い物リストを作成できるようにすることで、文字入力を手間を最小限にすること。
  4. 商品単価を計算・比較できる機能を実装すること。

# 洗い出した要件
  [要件定義シート](https://docs.google.com/spreadsheets/d/1Wq31HyNciqkcuxKOvnWm7vC5wkqVue3XJPCpaQlHjaU/edit#gid=104149554)

# 今後の課題・実装予定の機能
  - ユーザーの詳細表示及び編集機能
  - グループの編集機能
  - 在庫リストとお買い物リストについて、カテゴリや優先度によってソートできる機能
  - お買い物リストを更新した場合に、グループのメンバーに通知が行く機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/790419b39e6b6278938bbece4f4ca22f.png)](https://gyazo.com/790419b39e6b6278938bbece4f4ca22f)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/328002474db57a2b6eef78f4876a14b9.png)](https://gyazo.com/328002474db57a2b6eef78f4876a14b9)

# 開発環境
- フロントエンド
  - HTML
  - CSS
  - JavaScript
- バックエンド
  - Ruby on Rails
- インフラ
  - Render
  - AWS S3
- テキストエディタ
  - vsCode
- その他
  - Git/Github

# 制作時間
  約1ヶ月。160時間程度。

# ローカルでの動作方法
  下記のコマンドを実行
  - % git clone https://github.com/komafuji820/kauzoh.git
  - % cd kauzoh
  - % bundle install
  - % rails db:create
  - % rails db:migrate
  - % rails s

# 工夫したポイント
1. 3人以上でグループを作成することを想定し、sessionを利用したユーザー検索機能を実装しました。グループ作成を一度で完了させられるため、ユーザービリティが向上したと考えます。
2. 在庫とお買い物リストを紐づけることで、リストの作成の手間を極力省くよう設計しました。
3. スーパーなどでの利用を想定し、買い物カゴに入れると同時にチェックを付けられるようにしました。買い物後は、そのまま買い物完了ボタンを押せばリストが一括削除されるようになっており、いちいち削除する手間を省く設計となっています。

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :group_users
- has_many :groups, through: :group_users

## groups テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :group_users
- has_many :users, through: :group_users
- has_many :items
- has_many :orders
- has_many :purchases

## group_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| group  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       |            |                                |
| memo        | string     |                                |
| group       | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :category
- has_many :orders

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| memo        | string     |                                |
| group       | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| priority_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :item
- belongs_to :priority

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       |            |                                |
| memo        | string     |                                |
| group       | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
| priority_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :category
- belongs_to :priority