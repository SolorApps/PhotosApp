//
//  Service.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "Service.h"

@implementation Service

+ (id)shared {
    static Service *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

//- (void) fetchAlbums:(void (^)(NSString *))completion {
//    completion(@"aaa");
//}
- (void) testMethodWidthCompletion:(GenericBlock)completion{
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
