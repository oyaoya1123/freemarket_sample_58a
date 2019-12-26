class Categorybook < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '本' },
      { id: 2, value: '漫画' },
      { id: 3, value: '雑誌' },
      { id: 4, value: 'CD' },
      { id: 5, value: 'DVD/ブルーレイ' },
      { id: 6, value: 'レコード' },
      { id: 7, value: 'テレビゲーム' },
  ]
end