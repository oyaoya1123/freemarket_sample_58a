class Categorykids < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'ベビー服(女の子用)  ~95cm' },
      { id: 2, value: 'ベビー服(男の子用)  ~95cm' },
      { id: 3, value: 'ベビー服(男女兼用)  ~95cm' },
      { id: 4, value: 'キッズ服(女の子用) 100cm~' },
      { id: 5, value: 'キッズ服(男の子用) 100cm~' },
      { id: 6, value: 'キッズ服(男女兼用) 100cm~' },
      { id: 7, value: 'キッズ靴' },
      { id: 8, value: '子ども用ファッション小物' },
      { id: 9, value: 'おむつ/トイレ/バス' },
      { id: 10, value: '外出/移動用品' },
      { id: 11, value: '授乳/食事' },
      { id: 12, value: 'ベビー家具/寝具/室内用品' },
      { id: 13, value: 'おもちゃ' },
      { id: 14, value: '行事/記念品' },
      { id: 15, value: 'その他' }
  ]
end