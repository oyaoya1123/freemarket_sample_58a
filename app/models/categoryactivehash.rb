class Categoryactivehash < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    # メインカテゴリー
      { id: 1, value: 'レディース' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 2, value: 'メンズ' , sub: '0', sub_sub: '0', size: '', brand: '' },
      { id: 3, value: 'ベビー・キッズ' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 4, value: 'インテリア・住まい・小物' , sub: '0', sub_sub: '0', size: '', brand: '' },
      { id: 5, value: '本・音楽・ゲーム' , sub: '0', sub_sub: '0', size: '', brand: '' },
      { id: 6, value: 'おもちゃ・ホビー・グッズ' , sub: '0', sub_sub: '0', size: '', brand: '' },
      { id: 7, value: 'コスメ・香水・美容' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 8, value: '家電・スマホ・カメラ' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 9, value: 'スポーツ・レジャー' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 10, value: 'ハンドメイド' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 11, value: 'チケット' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 12, value: '自転車・オートバイ' , sub: '0', sub_sub: '0', size: '', brand: ''},
      { id: 13, value: 'その他' , sub: '0', sub_sub: '0', size: '', brand: ''},
  ]
end