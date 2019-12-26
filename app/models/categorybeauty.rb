class Categorybeauty < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'ベースメイク' },
      { id: 2, value: 'メイクアップ' },
      { id: 3, value: 'ネイルケア' },
      { id: 4, value: '香水' },
      { id: 5, value: 'スキンケア/基礎化粧品' },
      { id: 6, value: 'ヘアケア' },
      { id: 7, value: 'ボディケア' },
      { id: 8, value: 'オーラルケア' },
      { id: 9, value: 'リラクゼーション' },
      { id: 10, value: 'ダイエット' },
      { id: 11, value: 'その他' },
  ]
end