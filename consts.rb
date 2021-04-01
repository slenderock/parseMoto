URLS = %w[
  https://auto.ria.com/uk/auto_suzuki_sv_650s_28785079.html
  https://www.olx.ua/d/uk/obyavlenie/honda-cbr-600-srochno-IDEnSzG.html
  https://www.olx.ua/d/obyavlenie/suzuki-gsx-r-750-2005-IDL8rH3.html https://auto.ria.com/uk/auto_suzuki_gsx_r_750_29426335.html
  https://www.olx.ua/d/obyavlenie/kawasaki-zx6r-ninja-636-IDITlSv.html
  https://auto.ria.com/uk/auto_suzuki_sv_650s_27556577.html
  https://auto.ria.com/uk/auto_yamaha_fz6_fazer_26846927.html
  https://auto.ria.com/uk/auto_yamaha_fz6_fazer_28989131.html
  https://auto.ria.com/uk/auto_yamaha_yzf_r6_27999055.html
  https://www.olx.ua/d/obyavlenie/honda-cbr-600-rr-IDL8SKS.html
  https://auto.ria.com/uk/auto_kawasaki_ex-650_29349187.html
  https://www.olx.ua/d/obyavlenie/yamaha-fazer-fz6s2-och-horoshee-sostoyanie-IDLaCk7.html
  https://www.olx.ua/d/obyavlenie/kawasaki-zx-636-r-IDJnIHg.html
  https://www.olx.ua/obyavlenie/prodam-honda-cbr-600-f4i-IDL5Gf1.html
  https://www.olx.ua/d/obyavlenie/prodam-yamaha-fz6s-IDpf5do.html
  https://auto.ria.com/uk/auto_honda_cbr_600_28036365.html
  https://auto.ria.com/uk/auto_honda_cbr_500_27062326.html
  https://auto.ria.com/uk/auto_honda_cbr_600_28036365.html
  https://auto.ria.com/uk/auto_yamaha_fz6_fazer_24689846.html
  https://auto.ria.com/uk/auto_yamaha_yzf_27833680.html
  https://auto.ria.com/uk/auto_kawasaki_ninja_636_zx_6r_29130299.html
  https://auto.ria.com/uk/auto_kawasaki_ninja_650r_29226951.html
]

HTML_LABELS = {
  model: 'Марка, модель, рік'
}

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
  engine: nil
}

PARSING_ERROR = 'undefined'
ENGINE_RANGE = {
  min: 100,
  max: 1000
}