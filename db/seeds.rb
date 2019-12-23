Product_condition.create!(
  [
    
      {name: '新品、未使用'},
      {name: '未使用に近い'},
      {name: '目立った傷や汚れなし'},
      {name: 'やや傷や汚れあり'},
      {name: '傷や汚れあり'},
      {name: '全体的に状態が悪い'},

  ]
) 

Shipping_charge.create!(
  [
    
      {name: '送料込み(出品者負担)'},
      {name: '着払(購入者負担)'},
      {name: '目立った傷や汚れなし'},
      {name: 'やや傷や汚れあり'},
      {name: '傷や汚れあり'},
      {name: '全体的に状態が悪い'},

  ]
) 

Shipping_day.create!(
  [
    
      {name: '1~2日で発送'},
      {name: '2~3日で発送'},
      {name: '4~7日で発送'},

  ]
) 

Produt_status.create!(
  [
    
      {name: '出品中'},
      {name: '取引中'},
      {name: '売却済み'},
      {name: '過去の取引'}

  ]
) 