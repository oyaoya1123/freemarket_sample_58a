class Deliverymethod < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '未定' },
      { id: 2, value: 'らくらくメルカリ便' },
      { id: 3, value: 'ゆうメール' },
      { id: 4, value: 'レターパック' },
      { id: 5, value: '普通郵便(提携、定形外)' },
      { id: 6, value: 'クロネコヤマト' },
      { id: 7, value: 'ゆうパック' },
      { id: 8, value: 'クリックポスト' },
      { id: 9, value: 'ゆうパケット' },
  ]
end