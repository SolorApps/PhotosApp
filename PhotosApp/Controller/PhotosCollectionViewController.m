//
//  PhotosCollectionViewController.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/12/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "PhotosCollectionViewCell.h"
#import "PhotoViewController.h"
#import "Album.h"
#import "Service.h"

@interface PhotosCollectionViewController ()

// MARK:- IBOutlet, property
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) NSMutableArray<Album *> *albums;
@end

@implementation PhotosCollectionViewController

// MARK:- Variables
NSString * const reuseIdentifier = @"PhotosCollectionViewCell";
CGFloat space =  1;

// MARK:- Live Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

// MARK: - SetupViews
- (void)setupView {
    
    //setup navigation
    self.navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"Photos App";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    //setup collection view
    [self.collectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    //request albums from server
    [self fetchAlbums];
    
}

// MARK: - Methods

//gets all albums from the server
- (void) fetchAlbums {
    [self.activityIndicatorView startAnimating];
    Service *service = [Service shared];
    
    [service fetchAlbums:^(NSArray<Album *> * _Nullable albums, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activityIndicatorView startAnimating];
            });
        } else {
            if (albums) {
                self.albums = (id) albums;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.collectionView reloadData];
                    [self.activityIndicatorView startAnimating];
                });
            }
        }
    }];
}

// MARK: - UICollectionViewDataDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.albums.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PhotosCollectionViewCell * const cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Album *album = self.albums[indexPath.row];
    [cell.imageView loadImage:album.thumbnailUrl with:nil];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat cellSize = (collectionView.frame.size.width - (space*2))/3;
    return CGSizeMake(cellSize, cellSize);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return space;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return space;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Album *album = self.albums[indexPath.row];
    PhotoViewController *photoViewController = PhotoViewController.new;
    photoViewController.album = album;
    [self.navigationController pushViewController:photoViewController animated:YES];
}

@end
