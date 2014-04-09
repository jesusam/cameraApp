//
//  CASplashScreenViewController.m
//  cameraApp
//
//  Created by Jesus Morales on 4/8/14.
//  Copyright (c) 2014 Jesus Morales. All rights reserved.
//

#import "CASplashScreenViewController.h"

@interface CASplashScreenViewController ()

@property (strong, nonatomic) CASplashScreen *splashScreen;

@end

@implementation CASplashScreenViewController

@synthesize splashScreen = _splashScreen;
@synthesize imageArray = _imageArray;

- (id)init
{
    self = [super init];
    if (self) {
        
        // initialize image array
        NSLog(@"Initializing image array\n");
        [self setImageArray:[[NSMutableArray alloc] init]];
        
        // Custom initialization
        [self setSplashScreen:[[CASplashScreen alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]]];
        [self setView:[self splashScreen]];
        
        // set button targets
        [[[self splashScreen] takeNewPictureButton] addTarget:self action:@selector(newPictureButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [[[self splashScreen] chooseExistingButton] addTarget:self action:@selector(chooseExistingButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [[[self splashScreen] seeGalleryButton] addTarget:self action:@selector(seeGalleryButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - Button Press Methods
- (IBAction)newPictureButtonPressed:(id)sender
{
    NSLog(@"take new button pressed\n");
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        // create the camera interface
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [imagePicker setDelegate: self];
        [imagePicker setAllowsEditing:YES];
        
        // present camera interface
        [self presentViewController:imagePicker animated:YES completion:NULL];
        
    } else {
        // There is no camera. Display error message.
        NSLog(@"There is no camera available");
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"There is no camera available on this device" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (IBAction)chooseExistingButtonPressed:(id)sender
{
    NSLog(@"Choose Existing Button Pressed\n");
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        // create the gallery interface
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imagePicker setDelegate:self];
        [imagePicker setAllowsEditing:YES];
        
        // present gallery interface
        [self presentViewController:imagePicker animated:YES completion:NULL];
    } else {
        NSLog(@"There is no gallery available\n");
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"There is no gallery available on this device" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (IBAction)seeGalleryButtonPressed:(id)sender
{
    NSLog(@"See gallery button pressed\n");
    
    // transition to gallery view
    CAGalleryViewController *galleryViewController = [[CAGalleryViewController alloc] initWithImageArray:[self imageArray]];
    [galleryViewController setDelegate:self];
    [self presentViewController:galleryViewController animated:YES completion:NULL];
}

#pragma mark - UIImagePickerControllerDelegate Methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // check for edited image
    UIImage *original = info[UIImagePickerControllerOriginalImage];
    UIImage *edited = info[UIImagePickerControllerEditedImage];
    UIImage *imageToSave = (edited) ? edited : original;
    
    // save image
    [[self imageArray] addObject:imageToSave];
    
    // release picker
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"HELLO FROM THE CANCEL\n");
    // release picker
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - CAGalleryViewControllerDelegate Methods
- (void)galleryViewControllerIsDone
{
    // release the gallery view
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
