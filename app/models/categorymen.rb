class Categorymen < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'トップス' },
      { id: 2, value: 'ジャケット/アウター' },
      { id: 3, value: 'パンツ' },
      { id: 4, value: '靴' },
      { id: 5, value: 'バッグ' },
      { id: 6, value: 'スーツ' },
      { id: 7, value: '帽子' },
      { id: 8, value: 'アクセサリー' },
      { id: 9, value: '小物' },
      { id: 10, value: '時計' },
      { id: 11, value: '水着' },
      { id: 12, value: 'レッグウェア' },
      { id: 13, value: 'アンダーウェア' },
      { id: 14, value: 'その他' }
  ]
end