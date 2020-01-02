User.create!(
  [
    {
      id: '1',
      email: 'example@merukari.com',
      encrypted_password: '$2a$11$r6eXa24i.XnM1Refb8aZde6Pjm5CxYR7Yo4XozyneFgrRrhBpPAKK',
      password: 'Aamerukari58aA',
      password_confirmation:'Aamerukari58aA',
      created_at: '2019-12-27 00:01:01',
      updated_at: '2019-12-27 00:01:01',
      nickname: 'taro',
      last_name_kanji: '山田',
      first_name_kanji: '太郎',
      last_name_kana: 'やまだ',
      first_name_kana: 'たろう',
      birthdate_year: '2000',
      birthdate_month: '1',
      birthdate_day: '25',
      phone_number: '12345678901',

    },
    {
      email: 'testuser2@merukari.com',
      password: 'PassPass22user',
      password_confirmation:'PassPass22user',
      created_at: '2019-12-28 00:01:01',
      updated_at: '2019-12-28 00:01:01',
      nickname: 'ちえ',
      last_name_kanji: '赤坂',
      first_name_kanji: '智枝美',
      last_name_kana: 'あかさか',
      first_name_kana: 'ちえみ',
      birthdate_year: '2001',
      birthdate_month: '6',
      birthdate_day: '2',
      phone_number: '12345678900',

    }
  ]
)