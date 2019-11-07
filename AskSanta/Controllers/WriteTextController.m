//
//  WriteTextController.m
//  AskSanta
//
//  Created by Apple on 06/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "WriteTextController.h"
#import "HomeViewController.h"
#import "ChatController.h"

@interface WriteTextController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageview;

@property (strong, nonatomic) IBOutlet UITextView *textview;

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
@end

@implementation WriteTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeObject = [[HomeViewController alloc] init];
    [homeObject menuBtn:_sendBtn];
    
    _imageview.layer.cornerRadius = 15;
    _view1.layer.cornerRadius = 15;
    
    if ([_name isEqualToString:@"Santa Claus"]) {
        _imageview.image = [UIImage imageNamed:@"santa"];
        
    }
    else if ([_name isEqualToString:@"Easter Bunny"]) {
        _imageview.image = [UIImage imageNamed:@"easter"];
        
    }
    else if ([_name isEqualToString:@"Tooth Fairy"]) {
        _imageview.image = [UIImage imageNamed:@"tooth"];
        
    }
    else if ([_name isEqualToString:@"Cupid"]) {
        _imageview.image = [UIImage imageNamed:@"cupid"];
        
    }
   
    
}
-(void)viewWillAppear:(BOOL)animated{
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.textview.text = @"Enter text…";
    self.textview.textColor = [UIColor lightGrayColor];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OTHER METHODS

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Enter text…"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Enter text…";
        textView.textColor = [UIColor lightGrayColor]; 
    }
    [textView resignFirstResponder];
}
#pragma mark - BUTTON ACTION

- (IBAction)sendAction:(id)sender {
    if ([_textview.text isEqualToString:@""] || [_textview.text isEqualToString:@"Enter text…"]) {
    
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                       message:@"Write a message"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        ChatController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"ChatController"];
        view.senderString = _textview.text;
        view.senderName = _name;
        [self.navigationController pushViewController:view animated:YES];
    }
         
}


@end
