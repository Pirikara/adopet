# README

# 基本情報
概要
飼えなくなったペットの里親を募集できるサイトです。

URL
https://sample-adopet.herokuapp.com/

Basic認証
ID：admin
Pass：2222

投稿用アカウント
Email：b@example.com
Pass：1111aaaa

応募用アカウント
Email：a@example.com
Pass：1111aaaa

使用技術
Ruby/RubyonRails/MySQL/GitHub/VScode/Heroku/Postgresql/JQuery/Docker

開発期間
2～3週間

# 基本機能
### ユーザー関係
1. トップページにて、「Sign up」「Sign in」ボタンを押すことでモーダルが開きます。

[![Image from Gyazo](https://i.gyazo.com/08218fde64bf6679d0f94f42c98ce8e0.gif)](https://gyazo.com/08218fde64bf6679d0f94f42c98ce8e0)

2. ユーザー登録後、メールアドレスとパスワードによってログインができます。

3. マイページへ移動できます。

[![Image from Gyazo](https://i.gyazo.com/21e7d32895dd8c42aaf81edfca0533d1.gif)](https://gyazo.com/21e7d32895dd8c42aaf81edfca0533d1)

4. マイページでは、後に紹介する投稿済みの動物とトークルーム一覧を確認できます。

[![Image from Gyazo](https://i.gyazo.com/c261e5c2a5f79f094ba5244119ebfceb.gif)](https://gyazo.com/c261e5c2a5f79f094ba5244119ebfceb)

5. プロフィール編集から「アイコン」「名前」「自己紹介」を編集できます。

6. 「EDIT ACCOUNT」から「メールアドレス」「パスワード」を編集できます。

7. 「DELETE ACCOUNT」からユーザーアカウントの削除ができます。

### 動物関係
1. トップページの「全てのペットを見にいく」ボタンから投稿一覧ページへ移動できます。

[![Image from Gyazo](https://i.gyazo.com/e233f239b873411e62902258f4fcf78a.gif)](https://gyazo.com/e233f239b873411e62902258f4fcf78a)

2. エリア・カテゴリを選択すると検索結果の一覧が表示されます。

[![Image from Gyazo](https://i.gyazo.com/a1ef57188eb571542a9e4aa85ae4b2c3.gif)](https://gyazo.com/a1ef57188eb571542a9e4aa85ae4b2c3)

3. 「里親を募集する」ボタンから新規投稿ページへ移動、情報を入力して投稿できます。

[![Image from Gyazo](https://i.gyazo.com/a8e4e2a81c4e9513f547a836a3f2e076.gif)](https://gyazo.com/a8e4e2a81c4e9513f547a836a3f2e076)

4. 一覧ページから投稿詳細画面へ移動できます。

[![Image from Gyazo](https://i.gyazo.com/806d3c8782cb46044d51e81f889579e9.gif)](https://gyazo.com/806d3c8782cb46044d51e81f889579e9)

5. 詳細画面からは、投稿者のみ「投稿編集」「投稿削除」ができます。

[![Image from Gyazo](https://i.gyazo.com/303e0e6eabc008be8e4b4726fa5a08f9.gif)](https://gyazo.com/303e0e6eabc008be8e4b4726fa5a08f9)
[![Image from Gyazo](https://i.gyazo.com/246d226c153ca7c6de8a177bd1875bc7.gif)](https://gyazo.com/246d226c153ca7c6de8a177bd1875bc7)

6. コメント欄から動物についての公開質問ができます。

[![Image from Gyazo](https://i.gyazo.com/e407a2d5b4279e59ca6011569cac8138.gif)](https://gyazo.com/e407a2d5b4279e59ca6011569cac8138)

7. 投稿者以外のアカウントからは、里親に立候補ができます。

8. 「里親に応募する」ボタンを押すと、投稿者との個別チャットルームが作成されます。

[![Image from Gyazo](https://i.gyazo.com/023b8e0d8cca2df1a7c2cf1fe7b8b44e.gif)](https://gyazo.com/023b8e0d8cca2df1a7c2cf1fe7b8b44e)

9. 投稿者と応募者のユーザー詳細ページからは、チャットルームと新着メッセージが確認できます。

[![Image from Gyazo](https://i.gyazo.com/bde5dfd756a8745b9dace3331f924180.gif)](https://gyazo.com/bde5dfd756a8745b9dace3331f924180)

10. 投稿者側のチャットルームには、里親を決定するためのボタンが設置されます。

11. 「この人に里親決定」ボタンを押すと、投稿一覧・投稿詳細ページにラベルが貼られます。

[![Image from Gyazo](https://i.gyazo.com/26d5d716574433f25b9e31944eb20294.gif)](https://gyazo.com/26d5d716574433f25b9e31944eb20294)

### レスポンシブ対応
width基準で360pxをブレークポイントとし、スマホ画面に対応させています。
[![Image from Gyazo](https://i.gyazo.com/077c8db51acced00882575ed73a38097.gif)](https://gyazo.com/077c8db51acced00882575ed73a38097)