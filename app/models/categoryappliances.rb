class Categoryappliances < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'スマートフォン/携帯電話' },
      { id: 2, value: 'スマホアクセサリー' },
      { id: 3, value: 'PC/タブレット' },
      { id: 4, value: 'カメラ' },
      { id: 5, value: 'テレビ/映像機器' },
      { id: 6, value: 'オーディオ機器' },
      { id: 7, value: '美容/健康' },
      { id: 8, value: '冷暖房/空調' },
      { id: 9, value: '生活家電' },
      { id: 10, value: 'その他' },
  ]
end