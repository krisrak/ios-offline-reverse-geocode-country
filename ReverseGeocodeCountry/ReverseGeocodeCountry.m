//
//  ReverseGeocodeCountry.m
//  countrymap
//
//  Created by Initlabs on 2/25/14.
//  Copyright (c) 2014 Initlabs. All rights reserved.
//

#import "ReverseGeocodeCountry.h"

@interface ReverseGeocodeCountry() {
    NSArray *countryData;
}

@end

@implementation ReverseGeocodeCountry

// initialize ReversGeocodeCountry class
-(id)init{
    {
        if (self = [super init])
        {
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ReverseGeocodeCountry" ofType:@"json"];
            NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
            countryData = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];

        }
        return self;
    }
}

// returns TRUE if point is inside the polygon
- (BOOL) pointInPolygon : (float) lat : (float) lng : (NSArray*) polygon {
    BOOL found = FALSE;
    unsigned long i = 0;
    unsigned long j = 0;
    for(i = 0, j = [polygon count] - 1; i < [polygon count]; j = i++){
        if( (([[[polygon objectAtIndex:i] objectAtIndex:1] floatValue] > lat) != ([[[polygon objectAtIndex:j] objectAtIndex:1] floatValue] > lat)) && (lng < ( [[[polygon objectAtIndex:j] objectAtIndex:0] floatValue] - [[[polygon objectAtIndex:i] objectAtIndex:0] floatValue] ) * ( lat - [[[polygon objectAtIndex:j] objectAtIndex:1] floatValue] ) / ([[[polygon objectAtIndex:j] objectAtIndex:1] floatValue] - [[[polygon objectAtIndex:i] objectAtIndex:1] floatValue]) + [[[polygon objectAtIndex:i] objectAtIndex:0] floatValue] ) ){
            found = !found;
        }
    }
    return found;
}

// returns country name of the point
- (NSString*) getCountry: (float) lat : (float) lng {
    NSString * match = @"";
    int found = FALSE;
    for (int i=0; i<[countryData count]; i++){
        if([[[[countryData objectAtIndex:i] objectForKey:@"geometry"] valueForKey:@"type"] isEqualToString:@"Polygon"]){
            found = [self pointInPolygon: lat: lng: [[[[countryData objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] objectAtIndex:0]];
            if(found) {
                match = [NSString stringWithFormat:@"%@", [[countryData objectAtIndex:i] valueForKey:@"name"]];
                return match;
                break;
            }
        } else if([[[[countryData objectAtIndex:i] objectForKey:@"geometry"] valueForKey:@"type"] isEqualToString:@"MultiPolygon"]){
            for (int j=0; j<[[[[countryData objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] count]; j++){
                found = [self pointInPolygon: lat :lng: [[[[[countryData objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"coordinates"] objectAtIndex:j] objectAtIndex:0]];
                if(found) {
                    match = [NSString stringWithFormat:@"%@", [[countryData objectAtIndex:i] valueForKey:@"name"]];
                    return match;
                    break;
                }
            }
        }
    }
    return match;
}

@end
