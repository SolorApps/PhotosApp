//
//  Service.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface Service : NSObject

+ (nonnull instancetype)shared;

- (void) fetchAlbums:(nullable void(^)(NSArray<Album *>* _Nullable albums, NSError  * _Nullable error)) completion;

@end
