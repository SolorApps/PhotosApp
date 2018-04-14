//
//  PhotosCollectionViewController.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/12/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "PhotosCollectionViewCell.h"
#import "Album.h"
#import "Service.h"

@interface PhotosCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray<Album *> *albums;

@end

@implementation PhotosCollectionViewController

NSString * const reuseIdentifier = @"PhotosCollectionViewCell";
CGFloat space =  1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

// Setting up view
- (void)setupView {
    
    //setup navigation
    self.navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"Photos App";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
//    NSLog(@"%@", cellId);
    
    //setup collection view
    [self.collectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setupAlbums];
    
    Service *service = [Service shared];
  
//    [service fetchAlbums:^(NSString *result) {
//        <#code#>
//    }];
    
}

- (void) setupAlbums {
    self.albums = NSMutableArray.new;
    Album *album = Album.new;
    album.albumId = @(1);
    album.title = @"title";
    album.url = @"url";
    album.thumbnailUrl = @"thumbnailUrl";
    [self.albums addObject:album];
    [self.collectionView reloadData];
}

- (void) fetch {
    NSString *urlString = @"https://jsonplaceholder.typicode.com/photos";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"finished fetching");
        
        NSError *err;
        NSArray *albumsJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"Failded to serialed json %@", err);
            return;
        }
        
        NSMutableArray<Album *> *albums = NSMutableArray.new;
        for (NSDictionary *albumDict in albumsJSON) {
            
        }
        
        
    }] resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.albums.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PhotosCollectionViewCell * const cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Album *album = self.albums[indexPath.row];
    NSLog(@"%@", album.title);
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

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}


@end
