class Categorybicycle  < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '自動車本体 ' },
      { id: 2, value: '自動車タイヤ/ホイール' },
      { id: 3, value: '自動車パーツ' },
      { id: 4, value: '自動車アクセサリー' },
      { id: 5, value: 'オートバイ車体' },
      { id: 6, value: 'オートバイパーツ' },
      { id: 7, value: 'オートバイアクセサリー' },
  ]
end