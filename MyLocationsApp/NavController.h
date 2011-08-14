//
//  NavController.h
//  MyLocationsApp
//
//  Created by Wa-jiw Casey on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NavController : UITableViewController {
    NSArray *_locations;
    NSManagedObjectContext *_context;
}
@property(nonatomic,retain) NSArray *locations;
@property(nonatomic,retain) NSManagedObjectContext *context;

@end
