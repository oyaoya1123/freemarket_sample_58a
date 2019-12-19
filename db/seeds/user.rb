# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(
  [
    {
      last_name: '山田',
      first_name: '太郎',
      phone_number: '12345678901',
      profile_name: 'taro',
      profile_text: 'よろしくお願いします！',
      expiration_date_month: '01',
      expiration_date_days: '19',
      security_code: '001',
      nickname: 'taro',
      email: 'aaa@aaa',
      password: 'aaaaaaaa',
      birthday: '2000-01-01',
    },
    {
      last_name: '藤原',
      first_name: '次郎',
      phone_number: '02345678901',
      profile_name: 'jiro',
      profile_text: 'こんにちは',
      expiration_date_month: '02',
      expiration_date_days: '20',
      security_code: '002',
      nickname: 'jiro',
      email: 'bbb@bbb',
      password: 'bbbbbbbb',
      birthday: '2000-02-02',
    },
    {
      last_name: '佐藤',
      first_name: '三郎',
      phone_number: '01345678901',
      profile_name: 'saburo',
      profile_text: 'さようなら',
      expiration_date_month: '03',
      expiration_date_days: '10',
      security_code: '003',
      nickname: 'sabu',
      email: 'ccc@ccc',
      password: 'cccccccc',
      birthday: '1980-01-01',
    },
    {
      last_name: '田中',
      first_name: '四郎',
      phone_number: '01245678901',
      profile_name: 'shiro',
      profile_text: '家にある、未使用品・使わなくなった中古品を出品しています。即購入の方優先で、発送は1〜2日以内に、迅速で丁寧なお取引を心がけています。',
      expiration_date_month: '04',
      expiration_date_days: '23',
      security_code: '004',
      nickname: 'TASI',
      email: 'ddd@ddd',
      password: 'dddddddd',
      birthday: '1970-12-01',
    },
    {
      last_name: '小西',
      first_name: '涼太',
      phone_number: '01235678901',
      profile_name: 'kori',
      profile_text: '・一番安い方法で発送します。
      ・ご希望の発送方法について事前にコメントいただければ対応します。
      ・コメントの返信は1週間かかることもあります。
      ・梱包資材はリサイクルのものを使用する事があります。
      ・何でもお気軽にご相談ください。',
      expiration_date_month: '07',
      expiration_date_days: '24',
      security_code: '005',
      nickname: 'りょた',
      email: 'eee@eee',
      password: 'eeeeeeee',
      birthday: '1975-11-11',
    },
    {
      last_name: '大林',
      first_name: '咲',
      phone_number: '01234678901',
      profile_name: 'さき',
      profile_text: 'ご覧いただきありがとうございます。
      気持ち良いお取引を心がけています。
      中古品のため、多少の傷はご了承ください。
      お値下げにはできる限り対応いたします。
      お取り置きは基本致しません。
      どうぞよろしくお願いいたします。',
      expiration_date_month: '08',
      expiration_date_days: '25',
      security_code: '006',
      nickname: 'さき001',
      email: 'fff@fff',
      password: 'ffffffff',
      birthday: '1989-06-06',
    }

  ]
)