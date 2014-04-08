//
//  CAAppDelegate.h
//  cameraApp
//
//  Created by Jesus Morales on 4/8/14.
//  Copyright (c) 2014 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
