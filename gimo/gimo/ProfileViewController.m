//
//  ProfileViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/12/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Lock/Lock.h>
#import "ProfileViewController.h"

#import <ChameleonFramework/Chameleon.h>
#import <FlatUIKit/FlatUIKit.h>

@interface ProfileViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, strong) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet FUIButton *nextBtn;

@end

@implementation ProfileViewController

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // set background color
    self.view.backgroundColor = [UIColor blackColor];

    // remove topNavBar and backBtn
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationItem.hidesBackButton = YES;

    // pass userProfile.name to welcomeLabel
    self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome, %@", self.userProfile.name];

    // pass raw image data from userProfile.picture
    [[[NSURLSession sharedSession] dataTaskWithURL:self.userProfile.picture completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.avatarImageView.image = [UIImage imageWithData:data];
        });

    }] resume];

    // modify nextButton
    self.nextBtn.buttonColor = [UIColor flatPlumColorDark];
    self.nextBtn.shadowColor = [UIColor flatPlumColor];
    self.nextBtn.shadowHeight = 3.0f;
    self.nextBtn.cornerRadius = 8.0f;
    self.nextBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.nextBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

    // store this shit
    NSString *userName = [NSString stringWithFormat:@"%@", self.userProfile.name];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:@"userProfile"];
    [defaults synchronize];
}

@end


@implementation MyApplication
+ (MyApplication*)sharedInstance {
    static MyApplication *sharedApplication = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedApplication = [[self alloc] init];
    });
    return sharedApplication;
}

@end



//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
