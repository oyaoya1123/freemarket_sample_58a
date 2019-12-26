class Categoryother  < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'まとめ売り ' },
      { id: 2, value: 'ペット用品' },
      { id: 3, value: '食品' },
      { id: 4, value: '飲料/酒' },
      { id: 5, value: '日用品/生活雑貨/旅行' },
      { id: 6, value: 'アンティーク/コレクション' },
      { id: 7, value: '文房具/事務用品' },
      { id: 8, value: '事務/店舗用品' },
      { id: 9, value: 'その他' },
  ]
end