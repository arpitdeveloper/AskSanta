//
//  TextMeController.m
//  AskSanta
//
//  Created by Apple on 06/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "TextMeController.h"
#import "HomeViewController.h"
#import "WriteTextController.h"

@interface TextMeController ()

{
    NSString *imagename;
}
@property (strong, nonatomic) IBOutlet UIButton *santaBtn;
@property (strong, nonatomic) IBOutlet UIButton *easterBtn;
@property (strong, nonatomic) IBOutlet UIButton *toothBtn;
@property (strong, nonatomic) IBOutlet UIButton *cupidBtn;
@property (strong, nonatomic) IBOutlet UIButton *textmeBtn;

@property (strong, nonatomic) IBOutlet UILabel *santalb;
@property (strong, nonatomic) IBOutlet UILabel *easterkb;
@property (strong, nonatomic) IBOutlet UILabel *toothlb;
@property (strong, nonatomic) IBOutlet UILabel *cupidlb;

@end

@implementation TextMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeViewController *homeObject = [[HomeViewController alloc] init];
    [homeObject menuBtn:_textmeBtn];
    [self selectBtn:_santaBtn];
    [self selectBtn:_easterBtn];
    [self selectBtn:_toothBtn];
    [self selectBtn:_cupidBtn];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Design Method
-(void)selectBtn:(UIButton *)btn
{
    btn.layer.cornerRadius = 10;
}
#pragma mark - BUTTON ACTION

- (IBAction)cupidAction:(id)sender {
    imagename = _cupidlb.text;
}
- (IBAction)toothAction:(id)sender {
    imagename =_toothlb.text;
}
- (IBAction)easterAction:(id)sender {
    imagename =_easterkb.text;
}
- (IBAction)santaAction:(id)sender {
    imagename = _santalb.text;
}

- (IBAction)textAction:(id)sender {
    if (imagename == nil) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                       message:@"Select Option"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        WriteTextController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"WriteTextController"];
        view.name = imagename;
        [self.navigationController pushViewController:view animated:YES];
    }
}

@end
