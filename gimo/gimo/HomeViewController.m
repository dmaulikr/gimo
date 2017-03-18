//
//  HomeViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/12/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "HomeViewController.h"
#import "ProfileViewController.h"
#import <Lock/Lock.h>
#import <ChameleonFramework/Chameleon.h>
#import <FlatUIKit/FlatUIKit.h>

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet FUIButton *signinBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.signinBtn.buttonColor = [UIColor flatPlumColorDark];
    self.signinBtn.shadowColor = [UIColor flatPlumColor];
    self.signinBtn.shadowHeight = 3.0f;
    self.signinBtn.cornerRadius = 8.0f;
    self.signinBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.signinBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.signinBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

}

- (IBAction)showLoginController:(id)sender {
    A0Lock *lock = [A0Lock sharedLock];
//    self.view.backgroundColor = [UIColor blackColor];

    A0LockViewController *controller = [lock newLockViewController];
//    self.view.backgroundColor = [UIColor blackColor];

    controller.onAuthenticationBlock = ^(A0UserProfile *profile, A0Token *token) {
        // Do something with token & profile. e.g.: save them.
        // And dismiss the ViewController
        [self dismissViewControllerAnimated:YES completion:nil];
        [self performSegueWithIdentifier:@"ShowProfile" sender:profile];
    };

    [self presentViewController:controller animated:YES completion:nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowProfile"]) {
        ProfileViewController *destViewController = segue.destinationViewController;
        destViewController.userProfile = sender;
    }
}






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

@end
