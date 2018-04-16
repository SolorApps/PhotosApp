//
//  CachedImageView.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/15/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "CachedImageView.h"

@implementation CachedImageView

// Cache that will be used to store images
+ (NSCache *)imageCache {
    static NSCache *fooCache = nil;
    if (fooCache == nil) {
        fooCache = [[NSCache alloc] init];
    }
    return fooCache;
}

/**
 downloads and caches images downloaded from the internet
 - parameters:
    - urlString: url string of where the image can be found
    - completion: Completion block that can be executed once image is set
 */
- (void) loadImage:(NSString *)urlString with:(nullable void(^)(void))completion {
    
    self.urlStringForChecking = urlString;
    [CachedImageView.imageCache objectForKey: urlString];
    
    // Checking to see if the image is in cache and loads it if found
    if ([CachedImageView.imageCache objectForKey: urlString]) {
        UIImage *image = [CachedImageView.imageCache objectForKey: urlString];
        self.image = image;
        if (completion) {
            completion();
        }
        return;
    }
    
    // Checking to see if urlString is a valid url
    if ( [NSURL URLWithString:urlString]) {
        NSURL *url = [NSURL URLWithString:urlString];
        [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                return;
            }
            
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [CachedImageView.imageCache setObject:image forKey:urlString];
                    if (urlString == self.urlStringForChecking){
                        self.image = image;
                        if (completion) {
                            completion();
                        }
                    }
                });
            }
        }] resume];
    }
    
}

@end
