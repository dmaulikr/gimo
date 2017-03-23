//
//  READMEViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/20/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "READMEViewController.h"

@interface READMEViewController ()

@end

@implementation READMEViewController

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // .upper() for readme title
    self.title = @"README";

    // init webView
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    NSString *urlString = @"https://github.com/lovincyrus/gimo/blob/master/README.md";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    self.webView.backgroundColor = [UIColor blackColor];
    self.webView.delegate = self;

    [self.view addSubview:self.webView];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
