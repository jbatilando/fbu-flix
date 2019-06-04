//
//  LargePosterViewController.m
//  fbu_flix
//
//  Created by Miguel Batilando on 5/31/19.
//  Copyright © 2019 Miguel Batilando. All rights reserved.
//

#import "LargePosterViewController.h"
#import "UIImageView+AFNetworking.h"

@interface LargePosterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *largePosterView;

@end

@implementation LargePosterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.largePosterView setImageWithURL:posterURL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
