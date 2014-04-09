//
//  CASplashScreenViewController.h
//  cameraApp
//
//  Created by Jesus Morales on 4/8/14.
//  Copyright (c) 2014 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CASplashScreen.h"
#import "CAGalleryViewController.h"

@interface CASplashScreenViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, CAGalleryViewControllerDelegate>

@property (strong, nonatomic)NSMutableArray *imageArray;

- (IBAction)newPictureButtonPressed:(id)sender;
- (IBAction)chooseExistingButtonPressed:(id)sender;
- (IBAction)seeGalleryButtonPressed:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end
