//
//  CachedImageView.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/15/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CachedImageView : UIImageView

@property (copy,nonatomic,nonnull) NSString *urlStringForChecking;

+ (NSCache *_Nonnull) imageCache;

- (void) loadImage:(NSString *_Nonnull) urlString with: (nullable void(^)(void)) completion;

@end
