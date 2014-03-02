//
//  ReverseGeocodeCountry.h
//  countrymap
//
//  Created by Initlabs on 2/25/14.
//  Copyright (c) 2014 Initlabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReverseGeocodeCountry : NSObject

- (NSString*) getCountry: (float) lat : (float) lng;

@end
