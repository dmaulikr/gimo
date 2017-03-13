//
//  ProfileViewController.h
//  gimo
//
//  Created by 吳隆筠 on 3/12/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class A0UserProfile;
@class A0Lock;

@interface ProfileViewController: UIViewController

@property (nonatomic, strong) A0UserProfile *userProfile;

@end

@interface MyApplication : NSObject

@property (readonly, nonatomic) A0Lock *lock;
+ (MyApplication *)sharedInstance;

@end
