//
//  Album.m
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if ( self = [super init] ) {
        self.title = dictionary[@"title"];
    }
    return self;
}

@end
