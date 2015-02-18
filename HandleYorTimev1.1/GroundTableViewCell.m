//
//  GroundTableViewCell.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "GroundTableViewCell.h"

@implementation GroundTableViewCell

@synthesize cellTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
