//
//  DetailsViewController.m
//  fbu_flix
//
//  Created by Miguel Batilando on 5/22/19.
//  Copyright © 2019 Miguel Batilando. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "LargePosterViewController.h"

@interface DetailsViewController ()
// MARK: Outlets
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Tap gesture 
    UITapGestureRecognizer *newTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTapMethod)];
    [self.posterView setUserInteractionEnabled:YES];
    [self.posterView addGestureRecognizer:newTap];
    
    // Set poster view
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    // Set backdrop view
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    [self.backdropView setImageWithURL:backdropURL];
    
    // Set movie details
    self.titleLabel.text = self.movie[@"title"];
    self.overviewLabel.text = self.movie[@"overview"];
    self.dateLabel.text = self.movie[@"release_date"];
    
    [self.titleLabel sizeToFit];
    [self.overviewLabel sizeToFit];
}

// MARK: Methods
-(void)myTapMethod{
    [self performSegueWithIdentifier:@"LargePosterViewController" sender:nil];
}

// MARK: IBActions
- (IBAction)didTap:(UITapGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.view];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LargePosterViewController *largePosterViewController = [segue destinationViewController];
    largePosterViewController.movie = self.movie;
}

@end
