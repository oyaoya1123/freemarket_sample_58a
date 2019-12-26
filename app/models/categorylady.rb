class Categorylady < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'トップス' },
      { id: 2, value: 'ジャケット/アウター' },
      { id: 3, value: 'パンツ' },
      { id: 4, value: 'スカート' },
      { id: 5, value: 'ワンピース' },
      { id: 6, value: '靴' },
      { id: 7, value: 'ルームウェア/パジャマ' },
      { id: 8, value: 'レッグウェア' },
      { id: 9, value: '帽子' },
      { id: 10, value: 'バッグ' },
      { id: 11, value: 'アクセサリー' },
      { id: 12, value: 'ヘアアクセサリー' },
      { id: 13, value: '小物' },
      { id: 14, value: '時計' },
      { id: 15, value: 'ウィッグ/エクステ' },
      { id: 16, value: '浴衣/水着' },
      { id: 17, value: 'スーツ/フォーマルドレス' },
      { id: 18, value: 'マタニティ' },
      { id: 19, value: 'その他' }
  ]
end