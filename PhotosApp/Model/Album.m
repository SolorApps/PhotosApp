//
//  Album.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "Album.h"

@implementation Album

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ( self = [super init] ) {
        _albumId = [dictionary[@"albumId"] intValue];
        _title = dictionary[@"title"];
        _url = dictionary[@"url"];
        _thumbnailUrl = dictionary[@"thumbnailUrl"];
    }
    return self;
}

@end
