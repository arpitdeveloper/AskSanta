//
//  HomeViewController.m
//  AskSanta
//
//  Created by Apple on 06/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "HomeViewController.h"
#import "TextMeController.h"
@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UIButton *askBtn;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self menuBtn:_askBtn];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)menuBtn:(UIButton *)btn{
    btn.layer.cornerRadius = btn.bounds.size.height/2;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

    [self setNeedsStatusBarAppearanceUpdate];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
#pragma mark - BUTTON ACTION


- (IBAction)askAction:(id)sender {
    
    TextMeController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"TextMeController"];
    [self.navigationController pushViewController:view animated:YES];
}

@end
