ios-offline-reverse-geocode-country
===================================

 - iOS Class to reverse geocode country without any geocoding service API. 
 - reverse geocodes offline using static data from JSON file.
 - light weight reverse geocoder

How to use
----------

__Add the following files to your project:__

- ReverseGeocodeCountry.h
- ReverseGeocodeCountry.m
- ReverseGeocodeCountry.json
 
__Initialize object:__

`ReverseGeocodeCountry *reverseGeocode = [[ReverseGeocodeCountry alloc] init];`

__Call Method to get Country:__

`- (NSString*) getCountry: (float) lat : (float) lng;`

__Example:__

`NSString *countryName = [reverseGeocode getCountry:lat :lng];`

