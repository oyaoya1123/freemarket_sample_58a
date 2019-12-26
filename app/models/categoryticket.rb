class Categoryticket < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '音楽 ' },
      { id: 2, value: 'スポーツ' },
      { id: 3, value: '演劇/芸能' },
      { id: 4, value: 'イベント' },
      { id: 5, value: '映画' },
      { id: 6, value: '施設利用券' },
      { id: 7, value: '優待券/割引券' },
      { id: 8, value: 'その他' },
  ]
end