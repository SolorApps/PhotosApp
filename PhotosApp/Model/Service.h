//
//  Service.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GenericBlock)(BOOL success, NSString * _Nullable resultString);

@interface Service : NSObject

+ (id)shared;
//- (void) fetchAlbums;
//- (void)fetchAlbums:(void (^)(NSString *result))completion;

- (void)testMethodWidthCompletion:(nullable GenericBlock) completion;

@end
