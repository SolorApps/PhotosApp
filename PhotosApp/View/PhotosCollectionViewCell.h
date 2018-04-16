//
//  PhotosCollectionViewCell.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/12/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CachedImageView.h"

@interface PhotosCollectionViewCell : UICollectionViewCell
// MARK:- IBOutlet
@property (weak, nonatomic) IBOutlet CachedImageView *imageView;

@end
