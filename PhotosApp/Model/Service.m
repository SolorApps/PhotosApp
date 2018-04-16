//
//  Service.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "Service.h"
#import "Album.h"

@implementation Service

+ (instancetype)shared {
    static Service *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[Service alloc] init];
    });
    return sharedManager;
}

/**
 retrieves albums from a specific route
 - parameters:
    - completion: Completion block that will return a albums and an error
 */
- (void) fetchAlbums:(void(^)(NSArray<Album *>* _Nullable albums, NSError  * _Nullable error))completion {
    if (completion != nil) {
        NSString *urlString = @"https://jsonplaceholder.typicode.com/photos";
        NSURL *url = [NSURL URLWithString:urlString];
        [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"finished fetching");
            
            if (error) {
                NSLog(@"Failded network call %@", error);
                completion(nil,error);
                return;
            }
            
            NSError *err;
            NSArray *albumsJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            
            if (err) {
                NSLog(@"Failded to serialed json %@", err);
                completion(nil,err);
                return;
            }
            
            NSMutableArray<Album *> *albums = NSMutableArray.new;
            for (NSDictionary *albumDict in albumsJSON) {
                Album *album = [[Album alloc] initWithDictionary:albumDict];
                [albums addObject:album];
            }
            completion(albums, nil);
            
        }] resume];
    }
}


- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
