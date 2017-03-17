//
//  ViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/12/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "ViewController.h"
#import <ChameleonFramework/Chameleon.h>
#import <FlatUIKit/FlatUIKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FUIButton *startBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor flatYellowColor];

    _startBtn.buttonColor = [UIColor flatBlackColorDark];
    _startBtn.shadowColor = [UIColor flatPlumColor];
    _startBtn.shadowHeight = 3.0f;
    _startBtn.cornerRadius = 6.0f;
    _startBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_startBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [_startBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
