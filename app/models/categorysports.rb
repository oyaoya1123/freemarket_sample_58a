class Categorysports < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'ゴルフ' },
      { id: 2, value: 'フィッシング' },
      { id: 3, value: '自転車' },
      { id: 4, value: 'トレーニング/エクササイズ' },
      { id: 5, value: '野球' },
      { id: 6, value: 'サッカー/フットサル' },
      { id: 7, value: 'テニス' },
      { id: 8, value: 'スノーボード' },
      { id: 9, value: 'スキー' },
      { id: 10, value: 'その他スポーツ' },
      { id: 11, value: 'アウトドア' },
      { id: 12, value: 'その他' },
  ]
end