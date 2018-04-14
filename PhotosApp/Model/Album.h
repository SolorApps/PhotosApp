//
//  Album.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (strong,nonatomic) NSNumber *albumId;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *url;
@property (strong,nonatomic) NSString *thumbnailUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;


@end
