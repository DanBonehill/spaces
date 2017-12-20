module GeocodeStub
  Geocoder.configure(:lookup => :test)

  Geocoder::Lookup::Test.add_stub(
    "30 Grovefield Crescent, Coventry, CV7 7RE", [
      {
        'coordinates'  => [40.7143528, -74.0059731],
        'address'      => '30 Grovefield Crescent',
        'city'        => 'Coventry',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'coordinates'  => [40.7143528, -74.0059731],
      'address'      => '30 Grovefield Crescent',
      'city'        => 'Coventry',
      'country'      => 'United Kingdom',
      'country_code' => 'UK'
    }
  ]
)
end
