//
//  MovieAPIManager.h
//  fbu_flix
//
//  Created by Miguel Batilando on 6/30/20.
//  Copyright © 2020 Miguel Batilando. All rights reserved.
//

#import "AFURLSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieAPIManager : AFURLSessionManager
@property (nonatomic, strong) NSURLSession *session;
- (void)fetchNowPlaying:(void(^)(NSArray *movies, NSError *error))completion;
- (void)fetchPopularMovies:(void(^)(NSArray *movies, NSError *error))completion;
@end

NS_ASSUME_NONNULL_END
