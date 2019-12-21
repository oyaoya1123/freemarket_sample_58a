# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create!(
  [
    {
      name: 'GU ミッキー パジャマ',
      description: '数回着用後、クローゼットの中で眠っていました

      念のため洗濯した後発送致します。
      
      
      素人保管ですのでご理解頂ける方のみお願い致します。',
      price: '933'
    },
    {
      name: 'ピアス【新品、未使用】',
      description: 'レディースもののピアスです(*´ー`*)

      アクセサリーショップで購入しましたが、使わないままになっておりましたので出品します。
      新品、未使用ですが、自宅保管になりますので、ご理解いただける方でお願い致します。
      
      
      華やかでとても可愛いですよ(*˙ᵕ˙ *)
      
      ※ノンブランドです。',
      price: '350'
    },
    {
      name: 'ヒョウ柄　リングベルト＆スタンド用クリップ付　iPhoneケース',
      description: 'ヒョウ柄好きにはたまらない！
      丸いボタンをスライドすると、リングベルトを出し入れすることができます。
      リングベルト部分には折りたたみ可能なスタンドも収納されております。
      カバー部分はハードなプラスチック製、サイド部分はボタン操作もスムーズな柔らかいTPU製。',
      price: '799'
    }
  ]
)