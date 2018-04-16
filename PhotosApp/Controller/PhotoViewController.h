//
//  PhotoViewController.h
//  PhotosApp
//
//  Created by Erick Manrique on 4/16/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface PhotoViewController : UIViewController
// MARK:- Variables
@property (strong, nonatomic, nonnull) Album *album;
@end
