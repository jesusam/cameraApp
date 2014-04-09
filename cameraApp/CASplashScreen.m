//
//  CASplashScreen.m
//  cameraApp
//
//  Created by Jesus Morales on 4/8/14.
//  Copyright (c) 2014 Jesus Morales. All rights reserved.
//

#import "CASplashScreen.h"

#define GAP_SIZE 20.0f
#define BUTTON_HEIGHT 50.0f
#define BUTTON_WIDTH [[UIScreen mainScreen] applicationFrame].size.width - 2*GAP_SIZE


@implementation CASplashScreen

@synthesize takeNewPictureButton = _takeNewPictureButton;
@synthesize chooseExistingButton = _chooseExistingButton;
@synthesize seeGalleryButton = _seeGalleryButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor orangeColor]];
        
        // Create new picture button
        [self setTakeNewPictureButton:[[UIButton alloc] initWithFrame:CGRectMake(GAP_SIZE,
                                                                               [[UIScreen mainScreen] applicationFrame].size.height/2 - BUTTON_HEIGHT/2 - GAP_SIZE - BUTTON_HEIGHT,
                                                                               BUTTON_WIDTH,
                                                                               BUTTON_HEIGHT)]];
        [[self takeNewPictureButton] setBackgroundColor:[UIColor yellowColor]];
        [[self takeNewPictureButton] setTitle:@"Take New Picture" forState:UIControlStateNormal];
        [[self takeNewPictureButton] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // Create existing picture button
        [self setChooseExistingButton:[[UIButton alloc] initWithFrame:CGRectMake(GAP_SIZE,
                                                                                 [[UIScreen mainScreen] applicationFrame].size.height/2 - BUTTON_HEIGHT/2,
                                                                                 BUTTON_WIDTH,
                                                                                 BUTTON_HEIGHT)]];
        [[self chooseExistingButton] setBackgroundColor:[UIColor yellowColor]];
        [[self chooseExistingButton] setTitle:@"Choose Existing Picture" forState:UIControlStateNormal];
        [[self chooseExistingButton] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // Create gallery button
        [self setSeeGalleryButton:[[UIButton alloc] initWithFrame:CGRectMake(GAP_SIZE,
                                                                               [[UIScreen mainScreen] applicationFrame].size.height/2 + BUTTON_HEIGHT/2 + GAP_SIZE,
                                                                               BUTTON_WIDTH,
                                                                               BUTTON_HEIGHT)]];
        [[self seeGalleryButton] setBackgroundColor:[UIColor yellowColor]];
        [[self seeGalleryButton] setTitle:@"See Gallery" forState:UIControlStateNormal];
        [[self seeGalleryButton] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // add buttons to subview
        [self addSubview:[self seeGalleryButton]];
        [self addSubview:[self chooseExistingButton]];
        [self addSubview:[self takeNewPictureButton]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
