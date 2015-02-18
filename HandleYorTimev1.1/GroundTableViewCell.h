//
//  GroundTableViewCell.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroundTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellUser;
@property (weak, nonatomic) IBOutlet UILabel *cellDate;

@end
