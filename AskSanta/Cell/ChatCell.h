//
//  ChatCell.h
//  AskSanta
//
//  Created by Apple on 06/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imagecell;
@property (strong, nonatomic) IBOutlet UILabel *labelcell;
@property (strong, nonatomic) IBOutlet UIView *sendview;
@property (strong, nonatomic) IBOutlet UIView *sendView;
@property (strong, nonatomic) IBOutlet UILabel *sendLebel;
@property (strong, nonatomic) IBOutlet UIImageView *sendPic;
@end
