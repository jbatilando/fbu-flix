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
    
    NSString *posterURLString = self.movie[@"poster_path"];
    
    // Set low res poster
    NSString *smallPosterURLString = @"https://image.tmdb.org/t/p/w45/";
    NSString *smallPosterString = [smallPosterURLString stringByAppendingString:posterURLString];
    NSURL *smallPosterURL = [NSURL URLWithString:smallPosterString];
    [self.largePosterView setImageWithURL:smallPosterURL];
    
    // Set large res poster
    NSString *bigPosterURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *bigPosterString = [bigPosterURLString stringByAppendingString:posterURLString];
    NSURL *bigPosterURL = [NSURL URLWithString:bigPosterString];
    
    // Request
    NSURLRequest *request = [NSURLRequest requestWithURL:bigPosterURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    [self.largePosterView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        NSLog(@"Set large poster");
        [self.largePosterView setImageWithURL:bigPosterURL];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        // Show alert if no connection found
        NSLog(@"%@", [error localizedDescription]);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Something went wrong." message:@"Please try again." preferredStyle:(UIAlertControllerStyleAlert)];
        // Ok action - fetch movies
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
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
