class Categorygoods < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'おもちゃ' },
      { id: 2, value: 'タレントグッズ' },
      { id: 3, value: 'コミック/アニメグッズ' },
      { id: 4, value: 'トレーディングカード' },
      { id: 5, value: 'フィギュア' },
      { id: 6, value: '楽器/器材' },
      { id: 7, value: 'コレクション' },
      { id: 8, value: 'ミリタリー' },
      { id: 9, value: '美術品' },
      { id: 10, value: 'アート用品' },
      { id: 11, value: 'その他' },
  ]
end