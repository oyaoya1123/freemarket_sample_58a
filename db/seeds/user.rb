User.create!(
  [
    {
      email: 'example@merukari.com',
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

    },
    {
      email: 'testuser3@merukari.com',
      password: 'PassPass33user',
      password_confirmation:'PassPass33user',
      created_at: '2019-12-29 00:01:01',
      updated_at: '2019-12-29 00:01:01',
      nickname: 'ネコ',
      last_name_kanji: '鈴木',
      first_name_kanji: '敏之',
      last_name_kana: 'すずき',
      first_name_kana: 'としゆき',
      birthdate_year: '1990',
      birthdate_month: '9',
      birthdate_day: '29',
      phone_number: '12345678000',

    },
    {
      email: 'testuser4@merukari.com',
      password: 'PassPass44user',
      password_confirmation:'PassPass44user',
      created_at: '2019-12-29 00:11:01',
      updated_at: '2019-12-29 00:11:01',
      nickname: 'moriz',
      last_name_kanji: '橋下',
      first_name_kanji: '徹夜',
      last_name_kana: 'はしもと',
      first_name_kana: 'てつや',
      birthdate_year: '1998',
      birthdate_month: '11',
      birthdate_day: '29',
      phone_number: '12345670000',

    },
    {
      email: 'testuser5@merukari.com',
      password: 'PassPass55user',
      password_confirmation:'PassPass55user',
      created_at: '2019-12-29 01:11:01',
      updated_at: '2019-12-29 01:11:01',
      nickname: 'happy',
      last_name_kanji: '間宮',
      first_name_kanji: '亜紀',
      last_name_kana: 'まみや',
      first_name_kana: 'あき',
      birthdate_year: '1995',
      birthdate_month: '10',
      birthdate_day: '29',
      phone_number: '12345600000',

    },
    {
      email: 'testuser6@merukari.com',
      password: 'PassPass66user',
      password_confirmation:'PassPass66user',
      created_at: '2019-12-29 06:11:01',
      updated_at: '2019-12-29 06:11:01',
      nickname: 'スティーブンソン',
      last_name_kanji: '木村',
      first_name_kanji: '祐一',
      last_name_kana: 'きむら',
      first_name_kana: 'ゆういち',
      birthdate_year: '1980',
      birthdate_month: '6',
      birthdate_day: '20',
      phone_number: '12345000000',

    },
    {
      email: 'testuser7@merukari.com',
      password: 'PassPass77user',
      password_confirmation:'PassPass77user',
      created_at: '2019-12-29 16:11:01',
      updated_at: '2019-12-29 16:11:01',
      nickname: 'あみ',
      last_name_kanji: '本田',
      first_name_kanji: '麻実',
      last_name_kana: 'ほんだ',
      first_name_kana: 'あみ',
      birthdate_year: '1986',
      birthdate_month: '3',
      birthdate_day: '8',
      phone_number: '12340000000',

    },
    {
      email: 'testuser8@merukari.com',
      password: 'PassPass88user',
      password_confirmation:'PassPass88user',
      created_at: '2019-12-29 17:11:01',
      updated_at: '2019-12-29 17:11:01',
      nickname: 'monkey',
      last_name_kanji: '桜木',
      first_name_kanji: '花道',
      last_name_kana: 'さくらぎ',
      first_name_kana: 'はなみち',
      birthdate_year: '2001',
      birthdate_month: '7',
      birthdate_day: '7',
      phone_number: '12300000000',

    },
  ]
)

UsersExhibits.create!(
  [
    {
      user_id: '1',
      product_id: '1',
      created_at: '2019-12-29 00:01:01',
      updated_at: '2019-12-29 00:01:01',
      
    },
    {
      user_id: '1',
      product_id: '2',
      created_at: '2019-12-29 00:11:01',
      updated_at: '2019-12-29 00:11:01',
      
    },
    {
      user_id: '2',
      product_id: '3',
      created_at: '2019-12-29 00:12:01',
      updated_at: '2019-12-29 00:12:01',
      
    },
    {
      user_id: '3',
      product_id: '4',
      created_at: '2019-12-29 00:13:01',
      updated_at: '2019-12-29 00:13:01',
      
    },
    {
      user_id: '3',
      product_id: '5',
      created_at: '2019-12-29 00:14:01',
      updated_at: '2019-12-29 00:14:01',
      
    },
    {
      user_id: '3',
      product_id: '6',
      created_at: '2019-12-29 00:15:01',
      updated_at: '2019-12-29 00:15:01',
      
    },
    {
      user_id: '3',
      product_id: '7',
      created_at: '2019-12-29 00:16:01',
      updated_at: '2019-12-29 00:16:01',
      
    },
    {
      user_id: '3',
      product_id: '8',
      created_at: '2019-12-29 00:17:01',
      updated_at: '2019-12-29 00:17:01',
      
    },
    {
      user_id: '3',
      product_id: '9',
      created_at: '2019-12-29 00:18:01',
      updated_at: '2019-12-29 00:18:01',
      
    },
    {
      user_id: '4',
      product_id: '10',
      created_at: '2019-12-29 00:19:01',
      updated_at: '2019-12-29 00:19:01',
      
    },
    {
      user_id: '5',
      product_id: '11',
      created_at: '2019-12-29 00:19:11',
      updated_at: '2019-12-29 00:19:11',
      
    },