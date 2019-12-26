class Categoryinterior < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'キッチン/食器' },
      { id: 2, value: 'ベッド/マットレス' },
      { id: 3, value: 'ソファ/ソファベッド' },
      { id: 4, value: '椅子/チェア' },
      { id: 5, value: '机/テーブル' },
      { id: 6, value: '収納家具' },
      { id: 7, value: 'キッズ靴' },
      { id: 8, value: 'ラグ/カーペット/マット' },
      { id: 9, value: 'カーテン/ブラインド' },
      { id: 10, value: 'ライト/照明' },
      { id: 11, value: '寝具' },
      { id: 12, value: 'インテリア小物' },
      { id: 13, value: '季節/年中行事' },
      { id: 14, value: 'その他' }
  ]
end