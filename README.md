# アプリケーション名
  Kauzoh（買う蔵）

# アプリケーション概要
  家族間でお買い物リストを共有することができるアプリです。具体的には、次の機能があります。
  1. お買い物リストを作り、家族で共有することができます。
  2. 家にあるものを在庫として登録しておくことで、わずか2クリックでお買い物リストを作ることができます。
  3. 自分1人だけのグループを作成できます。家族に見られたくない内容の在庫・買い物リストを作ることができます。

# URL
  https://kauzoh.onrender.com

# テスト用アカウント
  Basic認証のユーザー名 admin
  Basic認証のパスワード noah1015
  テスト用ユーザー
    ニックネーム：花子 メールアドレス：hanako@test.com パスワード：123abc
    ニックネーム：太郎 メールアドレス：taro@test.com   パスワード：456def

# 利用方法
## グループの作成
  1. ヘッダーの"ユーザーとグループを作成"をクリックすると、ほかのユーザーを検索できます。
  2. 検索結果からグループに誘うユーザーを選んでグループ名を入力すると、グループを作成できます。
  3. "自分1人のグループを作成"をクリックすると、1人だけのグループを作成できます。

## 在庫登録
  1. グループリストからグループを選び、"在庫リスト"→"在庫を登録する"の順に進みます。
  2. カテゴリを入力後、メモまたは画像を投稿すると、在庫を登録できます。

## お買い物リスト登録
### 在庫リストから登録する場合
  1. グループリストからグループを選び、"お買い物リスト"→"お買い物リスト登録"の順に進みます。
  2. 登録画面にある"在庫から選ぶときはこちら"をクリックします。
  3. 在庫リストの中にある"お買い物リストに登録"をクリックします。
     または、グループを選び、"在庫リスト"→"お買い物リストに登録"と進むこともできます。
  4. 優先度を入力し、メモ（任意）を入力すると、お買い物リストを登録できます。
### 在庫にないものを登録する場合
  1. グループリストからグループを選び、"お買い物リスト"→"お買い物リスト登録"の順に進みます。
  2. カテゴリ・優先度を入力後、メモまたは画像を投稿すると、お買い物リストを登録できます。

## 単価比較機能
  1. グループリストからグループを選び、"お買い物リスト"→"単価を比較する"の順に進みます。
  2. 商品の価格と数量を入力し、商品単価を最大5つまで同時に比較できます。

# アプリケーションを作成した背景
  次のとおりペルソナを設定し、課題と解決策を洗い出しました。
## ペルソナ
- 性別：女性
- 年齢：40代
- 家族構成：夫と二人暮らし
- 仕事：事務職
- 買い物の頻度：ほぼ毎日。仕事終わりに買い物をする。たまに夫に買い物を頼むことがある。

## 買い物中に感じる課題
- 買い物に行く前に在庫をチェックする。しかし、それをメモするのが面倒。
- 商品パッケージのデザインが変わったり、似たようなデザインがあったりすると、いつも買っていたものがどれか迷ってしまう。
- 買いたいものを買い忘れることがある。
- 夫に買い物を頼むとき、指示が難しい。写真を見せた方が早い。
- 物価高なので、単価が一番安いものを計算できたら便利。

## 解決策
- より少ない手間で買い物リストを作成する機能
- 家にあるものを在庫として登録しておく機能
- 在庫や買い物リストを写真で保管しておく機能
- 買い物リストを家族で共有できるグループ機能
- 商品単価を計算・比較できる電卓機能

# 洗い出した要件
  [要件定義シート](https://docs.google.com/spreadsheets/d/1Wq31HyNciqkcuxKOvnWm7vC5wkqVue3XJPCpaQlHjaU/edit#gid=104149554)

# 実装予定の機能
  - ユーザーの詳細表示及び編集機能
  - グループの編集機能
  - 在庫リストとお買い物リストについて、カテゴリや優先度によってソートできる機能
  - お買い物リストを更新した場合に、グループのメンバーに通知が行く機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/083982cae0b533eab312c057e90e6414.png)](https://gyazo.com/083982cae0b533eab312c057e90e6414)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/3a0d440d18985dc35b0571c37c4506b5.png)](https://gyazo.com/3a0d440d18985dc35b0571c37c4506b5)

# 制作時間
  約1ヶ月。160時間程度。

<!-- 実装した機能についての画像やGIFおよびその説明※	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像はGyazoで、GIFはGyazoGIFで撮影すること。 -->

<!-- 開発環境	使用した言語・サービスを記載。 -->
<!-- ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。 -->
<!-- 工夫したポイント	制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。 -->
<!-- 改善点	より改善するとしたらどこか、それはどのようにしてやるのか。 -->

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
| category_id | integer    | null: false                    |
| priority_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :item
- belongs_to :category
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