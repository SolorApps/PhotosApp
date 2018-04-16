//
//  PhotoViewController.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/16/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "PhotoViewController.h"
#import "Album.h"
#import "CachedImageView.h"

@interface PhotoViewController ()
// MARK:- IBOutlet, property
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet CachedImageView *cachedImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end

@implementation PhotoViewController

// MARK:- Live Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

// MARK: - SetupViews
- (void)setupView {
    self.title = @"Photo";
    self.titleLabel.text = self.album.title;
    [self.activityIndicatorView startAnimating];
    [self.cachedImageView loadImage:self.album.url with:^{
        [self.activityIndicatorView stopAnimating];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
