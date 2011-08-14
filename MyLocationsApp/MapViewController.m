//
//  MapViewController.m
//  MyLocationsApp
//
//  Created by Wa-jiw Casey on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"

#import "Locations.h"

@implementation MapViewController

@synthesize context=_context;
@synthesize myMap = _myMap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"Locations";
    if([annotation isKindOfClass:[Location class]]){
        Location *location = (Location *) annotation;
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_myMap dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        annotationView.pinColor = MKPinAnnotationColorGreen;
        return annotationView;
    }
    
    return nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 41.99325287;
    zoomLocation.longitude = -87.72727957;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 10.5*METERS_PER_MILE, 10.5*METERS_PER_MILE);
    
    MKCoordinateRegion adjustedRegion = [_myMap regionThatFits:viewRegion];
    
    [_myMap setRegion:adjustedRegion animated:YES];
}

- (void)dealloc
{
    [_myMap release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setMyMap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)refreshPins:(id)sender {
    
    
    for (id<MKAnnotation> annotation in _myMap.annotations) {
        [_myMap removeAnnotation:annotation];
    }
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Locations" inManagedObjectContext:_context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error;
    
    NSArray *locations = [_context executeFetchRequest:fetchRequest error:&error];
    [fetchRequest release];
    
    for(Locations *location in locations)
    {
        NSNumber *lat = location.lat;
        NSNumber *lon = location.lon;
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = lat.doubleValue;
        coordinate.longitude = lon.doubleValue;
        Location *annotation = [[Location alloc] initWithName:location.name address:location.type coordinate:coordinate];
        [_myMap addAnnotation:annotation];
    }

    
}
@end
