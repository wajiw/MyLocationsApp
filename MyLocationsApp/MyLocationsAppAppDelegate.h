//
//  MyLocationsAppAppDelegate.h
//  MyLocationsApp
//
//  Created by Wa-jiw Casey on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavController.h"

@interface MyLocationsAppAppDelegate : NSObject <UIApplicationDelegate> {
    UINavigationController *_navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (IBAction)showMap:(id)sender;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
