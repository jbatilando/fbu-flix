//
//  Movie.h
//  fbu_flix
//
//  Created by Miguel Batilando on 6/30/20.
//  Copyright © 2020 Miguel Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, strong) NSString *backdropPath;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *overview;


- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries;
@end

NS_ASSUME_NONNULL_END
