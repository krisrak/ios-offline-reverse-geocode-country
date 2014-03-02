//
//  CMViewController.h
//  countrymap
//
//  Created by Initlabs on 2/25/14.
//  Copyright (c) 2014 Initlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CMViewController : UIViewController<MKMapViewDelegate>{
    IBOutlet MKMapView *map;
    IBOutlet UILabel *country;
}

@end
