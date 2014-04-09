//
//  CAGalleryViewController.h
//  cameraApp
//
//  Created by Jesus Morales on 4/8/14.
//  Copyright (c) 2014 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CAGalleryViewControllerDelegate <NSObject>

- (void)galleryViewControllerIsDone;

@end

@interface CAGalleryViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

- (id)initWithImageArray:(NSMutableArray *)imageArray;
- (void)setDelegate:(UIViewController<CAGalleryViewControllerDelegate> *)delegate;

@end
