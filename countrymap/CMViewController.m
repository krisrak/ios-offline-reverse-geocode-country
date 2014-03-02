//
//  CMViewController.m
//  countrymap
//
//  Created by Initlabs on 2/25/14.
//  Copyright (c) 2014 Initlabs. All rights reserved.
//

#import "CMViewController.h"
#import "ReverseGeocodeCountry.h"

@interface CMViewController () {
    ReverseGeocodeCountry *reverseGeocode;
}

@end

@implementation CMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    reverseGeocode = [[ReverseGeocodeCountry alloc] init];
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
    // get the center coordinate of the map
    CLLocationCoordinate2D centre = [map centerCoordinate];
    float lat = centre.latitude;
    float lng = centre.longitude;
    
    // call the ReverseGeocodeCountry mehtod to get country name
    country.text = [reverseGeocode getCountry:lat :lng];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
