class Categoryactivehash < ApplicationRecord
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'レディース' },
      { id: 2, value: 'メンズ' },
      { id: 3, value: '' },
      { id: 4, value: '着払い(購入者負担)' },
      { id: 5, value: '着払い(購入者負担)' },
      { id: 6, value: '着払い(購入者負担)' },
      { id: 7, value: '着払い(購入者負担)' },
      { id: 8, value: '着払い(購入者負担)' },
      { id: 9, value: '着払い(購入者負担)' },
      { id: 10, value: '着払い(購入者負担)' },
      { id: 11, value: '着払い(購入者負担)' },
      { id: 12, value: '着払い(購入者負担)' },
      { id: 13, value: '着払い(購入者負担)' },
  ]
end
