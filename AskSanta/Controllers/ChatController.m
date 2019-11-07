//
//  ChatController.m
//  AskSanta
//
//  Created by Apple on 06/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "ChatController.h"
#import "ChatCell.h"
#import "ReceiveMessageCell.h"
@interface ChatController ()<UITabBarDelegate, UITableViewDataSource>
{
    NSMutableDictionary *alldict;
    NSMutableDictionary *alldict2;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet UIButton *sendbutton;

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];

    //------Alloc init----------
    alldict = [[NSMutableDictionary alloc] init];
    alldict2 = [[NSMutableDictionary alloc] init];
    
    //------Santa Chat----------
    NSMutableDictionary *santaData = [[NSMutableDictionary alloc] init];
    
    [santaData setValue:@"Hello! Have you been good this year?" forKey:@"1"];
    [santaData setValue:@"What do you want for Christmas?" forKey:@"3"];
    [santaData setValue:@"I’ll do my best!" forKey:@"5"];
    [santaData setValue:@"Make sure you are good this year!" forKey:@"7"];
    [santaData setValue:@"Merry Christmas!" forKey:@"9"];
    [santaData setValue:@"Happy Holidays!" forKey:@"11"];
    UIImage *img = [UIImage imageNamed:@"santaEmoji"];
    [santaData setObject:img forKey:@"13"];

    NSMutableDictionary *santaData2 = [[NSMutableDictionary alloc] init];
    
    [santaData2 setValue:_senderString forKey:@"0"];
    [santaData2 setValue:@"Yes" forKey:@"2"];
    [santaData2 setValue:@"Somthing special" forKey:@"4"];
    [santaData2 setValue:@"ok" forKey:@"6"];
    [santaData2 setValue:@"Yes, i am good." forKey:@"8"];
    [santaData2 setValue:@"Merry Christmas!" forKey:@"10"];
    [santaData2 setValue:@"Thanks" forKey:@"12"];
    [santaData2 setValue:@"T" forKey:@"14"];
    //------Santa Chat----------
    
    //------Easter Chat---------
    NSMutableDictionary *easterDict = [[NSMutableDictionary alloc] init];
    [easterDict setValue:@"Happy Easter!" forKey:@"1"];
    [easterDict setValue:@"Did you find all of the eggs?" forKey:@"3"];
    [easterDict setValue:@"Did you get an Easter basket?" forKey:@"5"];
    [easterDict setValue:@"That’s wonderful!" forKey:@"7"];
    [easterDict setValue:@"Let’s hoppity hop-hop!" forKey:@"9"];
    [easterDict setObject:@"ok" forKey:@"11"];
    
    NSMutableDictionary *easterDict2 = [[NSMutableDictionary alloc] init];
    [easterDict2 setValue:_senderString forKey:@"0"];
    [easterDict2 setValue:@"Thanks" forKey:@"2"];
    [easterDict2 setValue:@"Yes " forKey:@"4"];
    [easterDict2 setValue:@"No" forKey:@"6"];
    [easterDict2 setValue:@"Ok" forKey:@"8"];
    [easterDict2 setValue:@"Ok" forKey:@"10"];
    [easterDict2 setValue:@"Thas" forKey:@"12"];
    //------Easter Chat---------
    
    //------Tooth Chat---------
    NSMutableDictionary *tooth = [[NSMutableDictionary alloc] init];
    [tooth setValue:@"Make sure to put your tooth under your pillow." forKey:@"1"];
    [tooth setValue:@"Do you want a treat?" forKey:@"3"];
    [tooth setValue:@"Sleep well." forKey:@"5"];
    [tooth setValue:@"Well, with a twirl of my wand we can make anything happen!" forKey:@"7"];
    [tooth setValue:@"Fairies love to fly!" forKey:@"9"];
    [tooth setObject:@"opk" forKey:@"11"];
    
    NSMutableDictionary *tooth2 = [[NSMutableDictionary alloc] init];
    [tooth2 setValue:_senderString forKey:@"0"];
    [tooth2 setValue:@"Thanks" forKey:@"2"];
    [tooth2 setValue:@"Yes " forKey:@"4"];
    [tooth2 setValue:@"ok" forKey:@"6"];
    [tooth2 setValue:@"Ok" forKey:@"8"];
    [tooth2 setValue:@"Yes" forKey:@"10"];
    [tooth2 setValue:@"Than" forKey:@"12"];
    //------Tooth Chat---------
    
    //------Cupid Chat---------
    NSMutableDictionary *cupid = [[NSMutableDictionary alloc] init];
    [cupid setValue:@"Happy Valentine’s Day" forKey:@"1"];
    [cupid setValue:@"Be sure to tell someone you love them." forKey:@"3"];
    [cupid setValue:@"Be loving this year!" forKey:@"5"];
    [cupid setValue:@"Love you!" forKey:@"7"];
    [cupid setValue:@"Can you fly, too?" forKey:@"9"];
    [cupid setObject:@"dfg" forKey:@"11"];
    
    NSMutableDictionary *cupid2 = [[NSMutableDictionary alloc] init];
    [cupid2 setValue:_senderString forKey:@"0"];
    [cupid2 setValue:@"Thanks" forKey:@"2"];
    [cupid2 setValue:@"Yes" forKey:@"4"];
    [cupid2 setValue:@"very lovely year" forKey:@"6"];
    [cupid2 setValue:@"love you too" forKey:@"8"];
    [cupid2 setValue:@"Yes" forKey:@"10"];
    //------Cupid Chat---------
    
    
    if ([_senderName isEqualToString:@"Santa Claus"]) {
        
        alldict = santaData;
        alldict2 = santaData2;
    }
    
    else if ([_senderName isEqualToString:@"Easter Bunny"]) {
        
        alldict = easterDict;
        alldict2 = easterDict2;
    }
    else if ([_senderName isEqualToString:@"Tooth Fairy"]) {
        
        alldict = tooth;
        alldict2 = tooth2;
    }
    else if ([_senderName isEqualToString:@"Cupid"]) {
        
        alldict = cupid;
        alldict2 = cupid2;
        
    }
    
    //-----Register Cell--------
    [self.tableview registerNib:[UINib nibWithNibName:@"ChatCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"ReceiveMessageCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cell";
    ReceiveMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if(cell == nil){
        
        cell = [[ReceiveMessageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
   
    if (indexPath.row % 2 == 0) {
        //---show & hide----
        cell.review.hidden = YES;
        cell.secondview.hidden = YES;
        cell.emoji.hidden = YES;
        cell.reciveview.hidden = NO;
        cell.reciveImage.hidden = NO;
        //---show & hide----
        
        //---design----
        cell.reciveview.layer.cornerRadius = 15;
        cell.reciveImage.layer.cornerRadius = cell.reciveImage.bounds.size.height/2;
        
        cell.secondview.layer.cornerRadius = 15;
        cell.review.layer.cornerRadius = cell.review.bounds.size.height/2;
        //---design----
        
        if ([_senderName isEqualToString:@"Santa Claus"]) {
            if (indexPath.row == 14) {
                cell.review.hidden = NO;
                cell.secondview.hidden = NO;
                cell.emoji.hidden = NO;
                cell.reciveview.hidden = YES;
                cell.reciveImage.hidden = YES;
                cell.relb.text = @"";
                cell.emoji.image = [UIImage imageNamed:@"SmileEmoji"];
            }
            else{
                cell.review.hidden = YES;
                cell.secondview.hidden = YES;
                cell.emoji.hidden = YES;
                cell.reciveview.hidden = NO;
                cell.reciveImage.hidden = NO;
                cell.recivelabel.text = [alldict2 valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
        }
        else if ([_senderName isEqualToString:@"Easter Bunny"]) {
            if (indexPath.row == 12) {
                cell.review.hidden = NO;
                cell.secondview.hidden = NO;
                cell.emoji.hidden = NO;
                cell.reciveview.hidden = YES;
                cell.reciveImage.hidden = YES;
                cell.relb.text = @"";
                cell.emoji.image = [UIImage imageNamed:@"SmileEmoji"];
            }
            else{
                cell.review.hidden = YES;
                cell.secondview.hidden = YES;
                cell.emoji.hidden = YES;
                cell.reciveview.hidden = NO;
                cell.reciveImage.hidden = NO;
                cell.recivelabel.text = [alldict2 valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
            
        }
        else if ([_senderName isEqualToString:@"Tooth Fairy"]) {
            
            if (indexPath.row == 12) {
                cell.review.hidden = NO;
                cell.secondview.hidden = NO;
                cell.emoji.hidden = NO;
                cell.reciveview.hidden = YES;
                cell.reciveImage.hidden = YES;
                cell.relb.text = @"";
                
                cell.emoji.image = [UIImage imageNamed:@"SmileEmoji"];
            }
            else{
                cell.review.hidden = YES;
                cell.secondview.hidden = YES;
                cell.emoji.hidden = YES;
                cell.reciveview.hidden = NO;
                cell.reciveImage.hidden = NO;
                cell.recivelabel.text = [alldict2 valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
        }
        else if ([_senderName isEqualToString:@"Cupid"]) {
            
            cell.recivelabel.text = [alldict2 valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
        }
    }
    else{
        //---show & hide----
        cell.reciveview.hidden = YES;
        cell.reciveImage.hidden = YES;
        cell.emoji.hidden = YES;
        cell.review.hidden = NO;
        cell.secondview.hidden = NO;
        //---show & hide----
        
        //---design----
        cell.secondview.layer.cornerRadius = 15;
        cell.review.layer.cornerRadius = cell.review.bounds.size.height/2;
        //---design----

        if ([_senderName isEqualToString:@"Santa Claus"]) {
            
            cell.review.image = [UIImage imageNamed:@"santa"];
            
            if (indexPath.row == 13) {
                
                cell.emoji.hidden = NO;
                cell.emoji.image = [UIImage imageNamed:@"santaEmoji"];
                cell.relb.text = @"";
            }
            else{
                
                cell.emoji.hidden = YES;
                cell.relb.text = [alldict valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
        }
        else if ([_senderName isEqualToString:@"Easter Bunny"]) {
            
            cell.review.image = [UIImage imageNamed:@"easter"];
            
            if (indexPath.row == 11) {

                cell.emoji.hidden = NO;
                cell.emoji.image = [UIImage imageNamed:@"easterEmoji"];
                cell.relb.text = @"";
            }
            else{
                
                cell.emoji.hidden = YES;
                cell.relb.text = [alldict valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
        }
        else if ([_senderName isEqualToString:@"Tooth Fairy"]) {
            
            cell.review.image = [UIImage imageNamed:@"tooth"];
            
            if (indexPath.row == 11) {
                
                cell.emoji.hidden = NO;
                cell.emoji.image = [UIImage imageNamed:@"toothEmoji"];
                cell.relb.text = @"";
            }
            else{
                
                cell.emoji.hidden = YES;
                cell.relb.text = [alldict valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
        }
       
        else if ([_senderName isEqualToString:@"Cupid"]) {
            
            cell.review.image = [UIImage imageNamed:@"cupid"];
            
            if (indexPath.row == 11) {
                
                cell.emoji.hidden = NO;
                cell.emoji.image = [UIImage imageNamed:@"CupidEmoji"];
                cell.relb.text = @"";
            }
            else{
                
                cell.emoji.hidden = YES;
                cell.relb.text = [alldict valueForKey:[NSString stringWithFormat:@"%li", (long)indexPath.row]];
            }
        }
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return (alldict.count + alldict2.count);
}

@end
