ios-offline-reverse-geocode-country
===================================

This is an Objective-C Module to reverse geocode country without any geocoding service API, the reverse geocoding is done offline using static country polygon data from a JSON file. Light weight reverse geocoder that uses approximated country boundaries. The method will return the country name for a given latitude and longitude.

How to use
----------

The country reverse geocoder files are available in the `ReverseGeocodeCountry` folder.

__Add the following files to your project:__

- ReverseGeocodeCountry.h
- ReverseGeocodeCountry.m
- ReverseGeocodeCountry.json
 
__Initializing object:__

`ReverseGeocodeCountry *reverseGeocode = [[ReverseGeocodeCountry alloc] init];`

__Method to get Reverse Geocoded Country Name:__

`- (NSString*) getCountry: (float) lat : (float) lng;`

`lat` and `lng` are the latitude and longitude of the point to be reverse geocoded and the method will return the country name string or an empty string if there is no country in the reverse geocoded point.

__Example:__

`NSString *countryName = [reverseGeocode getCountry:lat :lng];`

Sample App
----------

There is a iOS sample project `countrymap` included in this repo which uses the `ReverseGeocodeCountry` module to update the name of country based on where the map is dragged.

![countrymap](https://f.cloud.github.com/assets/1414842/2304702/08b7a6e6-a230-11e3-87ac-9dbeb9bcea45.png)

Attribution
-----------

The JSON data for country polygon and the reverse geocoding algorithm used in this module was implemented based on the  ___country-reverse-geocoding___ nodejs module available at [https://github.com/teleportd/country-reverse-geocoding](https://github.com/teleportd/country-reverse-geocoding)

License
-------

ReverseGeocodeCountry is licensed under the terms of the MIT License
