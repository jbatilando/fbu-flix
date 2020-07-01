//
//  Movie.m
//  fbu_flix
//
//  Created by Miguel Batilando on 6/30/20.
//  Copyright © 2020 Miguel Batilando. All rights reserved.
//

#import "Movie.h"

@implementation Movie
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    self.title = dictionary[@"title"];
    self.overview = dictionary[@"overview"];
    self.posterPath = dictionary[@"poster_path"];
    self.backdropPath = dictionary[@"backdrop_path"];
    self.releaseDate = dictionary[@"release_date"];

    // Set the other properties from the dictionary

    return self;
}

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *movies = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        // Tweet *fakeTweet = [Tweet alloc];
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    return movies;
}
@end
