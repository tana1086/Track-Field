■サービス概要
どんなサービスなのかを３行で説明してください。

陸上。競技の大会成績や日々の練習記録を保存・共有できるサービスです
ユーザーは大会ごとの成績や日々の練習内容を簡単に登録・管理することでき、過去の成績を一目で振り返ることができます。
成績をグラフやランキングで可視化し、個人やチーム全体の成長を実感を感じ、選手間の競争意識やモチベーション向上をサポートします。

■ このサービスへの思い・作りたい理由
このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。
このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。

私自身、14年間陸上競技に取り組み、大会に出場してきました。これまで、大会結果の記録には主に携帯のメモ帳アプリ、日々の練習の感想等はX（旧:Twitter）を使用していましたが、
過去の記録の振り返る際に検索が難しく、成績の向上を確認するためには手動で計算しなければいけないことが不便に感じていました。
また、キャプテンを務めていたときには、チームメンバーが個別に成績をメモ帳で成績を管理していたため、チームメンバーの記録を把握することが難しく、
進捗管理をするのが大変でした。
そのため、チーム内での記録共有ができれば、個人の成績だけでなく、チーム全体の進捗や順位を視覚化でき、より一層モチベーションアップが
高まると考えてます。
こうした経験から同じような悩みを抱える競技者のために、簡単で効率的な記録の手段を提供したいと思い、このサービスを開発しようと考えました。

■ ユーザー層について
決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

◯陸上競技の競技者または指導者
 ・競技者:
   自身の競技結果やトレーニング日誌の記録を手軽に管理でき、成績の向上を実感できる。

 ・指導者:
   チーム内の記録が一目でわかり、チーム全体の進捗管理がしやすくなる。

■サービスの利用イメージ
ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

◯練習や大会終わりに、スマホでささっとその日の感覚や感想を書き留めておき、いつでも見返すことができる。
◯成績や練習量をグラフで確認し、達成感を得ることができる。

■ ユーザーの獲得について
想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。

◯友人や知人に紹介
 ・自身の陸上競技経験を活かし、競技仲間に直接利用を促す。

■ サービスの差別化ポイント・推しポイント
似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

[似たサービス] リクラウド

[差別化ポイント]
◯トレーニング日記
・個人の練習記録や大会の感想を手軽に記録・管理ができます。

◯目標設定と進捗管理
・ユーザー自身の競技目標を設定し、大会の結果を通じて進捗確認ができます。

◯バッジシステム
・目標達成や特定の条件を満たした際にバッジが付与され、競技者の努力の成果を実感できます。

◯隣県の大会情報通知（可能であれば）
・登録した県の隣県で開催される大会情報をカレンダーを通じて確認できます。

■ 機能候補
MVPリリース
・会員登録（メール認証）
・ログイン・ログアウト機能
・投稿機能（大会結果・練習記録）
・プロフィール機能（自己紹介、目標設定、進捗確認、自己ベスト、シーズンベスト一覧）
・グラフ機能
・CSV出力機能

本リリース
・トレーニング日記機能
・チーム機能（記録とランキング）
・バッジ機能(目標達成時の報酬)
・Tips機能（体のケアや練習方法の提供）
・カレンダー機能（近隣の大会情報を表示）
・ユーザー検索（オートコンプリート）

■ 機能の実装方針予定
一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。
・カレンダー機能（日本陸上競技連盟公式サイトからスクレイピング？してカレンダーに登録）
・マルチ検索・オートコンプリート
・大会結果の投稿機能（ステップ入力）
