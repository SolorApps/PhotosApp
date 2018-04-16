//
//  Album.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/13/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic,readonly) int albumId;
@property (copy,nonatomic,readonly,nonnull) NSString *title;
@property (copy,nonatomic,readonly,nonnull) NSString *url;
@property (copy,nonatomic,readonly,nonnull) NSString *thumbnailUrl;

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;


@end
