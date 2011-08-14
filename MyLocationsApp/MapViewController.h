//
//  MapViewController.h
//  MyLocationsApp
//
//  Created by Wa-jiw Casey on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController : UIViewController <MKMapViewDelegate> {
    NSManagedObjectContext *_context;
    MKMapView *_myMap;
}

@property(nonatomic,retain) NSManagedObjectContext *context;
@property (nonatomic, retain) IBOutlet MKMapView *myMap;
- (IBAction)refreshPins:(id)sender;

@end
