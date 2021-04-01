URLS = %w[
 https://auto.ria.com/uk/auto_kawasaki_z_750_29462467.html
]

SITES = {
  auto_ria: 'auto.ria.com',
  olx: 'olx.ua'
}

RESPONSE_INTERFACE = {
  brand: nil,   
  model: nil, 
  year: nil, 
  price: nil,
  city: nil,
  engine: nil,
  url: nil
}

PARSING_ERROR = 'undefined'
ENGINE_RANGE = {
  min: 100,
  max: 1000
}

YEAR_RANGE = {
  min: 2005,
  max: 2020
}