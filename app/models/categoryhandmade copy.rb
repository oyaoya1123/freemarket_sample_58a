class Categoryticket < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'アクセサリー(女性用)' },
      { id: 2, value: 'ファッション/小物' },
      { id: 3, value: 'アクセサリー/時計' },
      { id: 4, value: '日用品/インテリア' },
      { id: 5, value: '趣味/おもちゃ' },
      { id: 6, value: 'キッズ/ベビー' },
      { id: 7, value: '素材/材料' },
      { id: 8, value: '二次創作物' },
      { id: 9, value: 'その他' },
  ]
end