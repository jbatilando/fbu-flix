//
//  DetailsViewController.h
//  fbu_flix
//
//  Created by Miguel Batilando on 5/22/19.
//  Copyright © 2019 Miguel Batilando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
// MARK: Properties
@property (nonatomic, strong) Movie *movie;

@end

NS_ASSUME_NONNULL_END
