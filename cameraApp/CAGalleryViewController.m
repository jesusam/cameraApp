//
//  CAGalleryViewController.m
//  cameraApp
//
//  Created by Jesus Morales on 4/8/14.
//  Copyright (c) 2014 Jesus Morales. All rights reserved.
//

#import "CAGalleryViewController.h"

#define GAP_SIZE 20.0f
#define BUTTON_HEIGHT 50.0f
#define SCREEN_WIDTH [[UIScreen mainScreen] applicationFrame].size.width
#define BUTTON_WIDTH SCREEN_WIDTH - 2*GAP_SIZE
#define SPACE_BETWEEN_TILES 10

@interface CAGalleryViewController ()

@property (strong, nonatomic)NSMutableArray *imageArray;
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)UIButton *backButton;
@property (weak, nonatomic)UIViewController<CAGalleryViewControllerDelegate> *delegate;

- (IBAction)backButtonPressed:(id)sender;

@end

@implementation CAGalleryViewController

@synthesize imageArray = _imageArray;
@synthesize collectionView = _collectionView;
@synthesize backButton = _backButton;

- (id)initWithImageArray:(NSMutableArray *)imageArray
{
    self = [super initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    if (self) {
        // Custom initialization
        [self setImageArray:imageArray];
        
        // set imageview
        [self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]]];
        [[self view] setBackgroundColor:[UIColor whiteColor]];
        
        // set back button
        [self setBackButton:[[UIButton alloc] initWithFrame:CGRectMake(20,
                                                                       20,
                                                                       [[UIScreen mainScreen] applicationFrame].size.width - 40,
                                                                       50)]];
        [[self backButton] setBackgroundColor:[UIColor orangeColor]];
        [[self backButton] setTitle:@"Back" forState:UIControlStateNormal];
        [[self backButton] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [[self backButton] addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // set collection view
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        [self setCollectionView:[[UICollectionView alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_TILES,
                                                                                  2*GAP_SIZE + BUTTON_HEIGHT,
                                                                                  [[UIScreen mainScreen] applicationFrame].size.width - 2*SPACE_BETWEEN_TILES,
                                                                                   [[UIScreen mainScreen] applicationFrame].size.height - (GAP_SIZE + BUTTON_HEIGHT)) collectionViewLayout:layout]];
        [[self collectionView] setBackgroundColor:[UIColor whiteColor]];
        [[self collectionView] setDelegate:self];
        [[self collectionView] setDataSource:self];
        [[self collectionView] setShowsVerticalScrollIndicator:NO];
        [[self collectionView] registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        
        // add subviews to main view
        [[self view] addSubview:[self backButton]];
        [[self view] addSubview:[self collectionView]];
    }
    return self;
}

- (void)setDelegate:(UIViewController<CAGalleryViewControllerDelegate> *)delegate
{
    _delegate = delegate;
}

- (IBAction)backButtonPressed:(id)sender
{
    // dismiss self from splash screen view controller
    [[self delegate] galleryViewControllerIsDone];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self imageArray] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor purpleColor]];
    // set cell content
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          ([[UIScreen mainScreen] applicationFrame].size.width - 5*SPACE_BETWEEN_TILES)/4,
                                                                           ([[UIScreen mainScreen] applicationFrame].size.width - 5*SPACE_BETWEEN_TILES)/4)];
    UIImage *image = [[self imageArray] objectAtIndex:indexPath.row];
    [imageView setImage:image];
    [cell addSubview:imageView];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([[UIScreen mainScreen] applicationFrame].size.width - 5*SPACE_BETWEEN_TILES)/4, ([[UIScreen mainScreen] applicationFrame].size.width - 5*SPACE_BETWEEN_TILES)/4);
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
