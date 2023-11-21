# nagano-cake
**ECサイト 未実装部分あり**

ケーキ屋のECサイト

ユーザー機能、商品の注文、カート機能、履歴など

管理者機能、ジャンル編集、商品編集、注文・製作ステータス更新、ユーザー編集など

## Images
- User
<p align="center">
  <img src="img/home.png" alt="img/home.png" width="200"/>
  <img src="img/signup.png" alt="img/signup.png" width="200"/>
  <img src="img/my_page.png" alt="img/my_page.png" width="200"/>
  <img src="img/user_edit.png" alt="img/user_edit.png" width="200"/>
  <img src="img/user_exit.png" alt="img/user_exit.png" width="200"/>
  <img src="img/address.png" alt="img/address.png" width="200"/>
  <img src="img/address_edit.png" alt="img/address_edit.png" width="200"/>
  <img src="img/items.png" alt="img/items.png" width="200"/>
  <img src="img/item_detail.png" alt="img/item_detail.png" width="200"/>
  <img src="img/cart.png" alt="img/cart.png" width="200"/>
  <img src="img/order_info.png" alt="img/order_info.png" width="200"/>
  <img src="img/order_confirm.png" alt="img/order_confirm.png" width="200"/>
</p>

- Admin
<p align="center">
  <img src="img/admin_login.png" alt="img/admin_login.png" width="200"/>
  <img src="img/admin_items.png" alt="img/admin_items.png" width="200"/>
  <img src="img/admin_item_detail.png" alt="img/admin_item_detail.png" width="200"/>
  <img src="img/admin_item_create.png" alt="img/admin_item_create.png" width="200"/>
  <img src="img/admin_users.png" alt="img/admin_users.png" width="200"/>
  <img src="img/admin_genre.png" alt="img/admin_genre.png" width="200"/>
  <img src="img/admin_order.png" alt="img/admin_order.png" width="200"/>
  <img src="img/admin_order_detail.png" alt="img/admin_order_detail.png" width="200"/>
</p>

## 使用方法
- 一般ユーザー
  - 新規登録を行ってからログイン
- 管理者
  - .../adminにアクセスし、管理者アドレスとパスワードでログイン
```
email: "test@mail"
password: "123456"
```

## Usage
```
$ bundle install
$ rails webpacker:install (when asked, answer Y)
$ rails webpacker:compile
$ rails db:migrate
$ rails db:seed
```
```
$ rails s
```
If "Webpacker::Manifest::MissingEntryError" occur
```
$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object
```

## Version
※2023/07/01　時点
- Rails 6.1.7.3
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
- node v16.19.0
- yarn 1.22.19
- Version: ImageMagick 7.1.1-5 Q16-HDRI x86_64 92a5afcfa:20230326 https://imagemagick.org
  - Copyright: (C) 1999 ImageMagick Studio LLC
  - License: https://imagemagick.org/script/license.php
  - Features: Cipher DPC HDRI OpenMP(4.5)
  - Delegates (built-in): jng jpeg lzma png tiff xml zlib
  - Compiler: gcc (7.3)
- sqlite3 3.42.0
