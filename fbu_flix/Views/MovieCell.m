//
//  MovieCell.m
//  fbu_flix
//
//  Created by Miguel Batilando on 5/21/19.
//  Copyright © 2019 Miguel Batilando. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMovie:(Movie *)movie {
    // Since we're replacing the default setter, we have to set the underlying private storage _movie ourselves.
    // _movie was an automatically declared variable with the @propery declaration.
    // You need to do this any time you create a custom setter.
    _movie = movie;

    self.titleLabel.text = self.movie.title;
    self.overviewLabel.text = self.movie.overview;
    
    // Get movie poster URL
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = movie.posterPath;
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];

    // Set Movie Cell (should have a setter function in class)
    self.titleLabel.text = movie.title;
    self.overviewLabel.text = movie.overview;
    self.posterView.image = nil;
    [self.posterView setImageWithURL:posterURL];
    self.posterView.alpha = 0;

    // Fade movie poster image in as it loads
    [UIImageView animateWithDuration:1.5 animations:^{
        self.posterView.alpha = 1;
    }];

    self.posterView.image = nil;
    if (self.movie.posterPath != nil) {
        [self.posterView setImageWithURL:posterURL];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
