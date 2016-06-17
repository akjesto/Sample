//
//  CustomCell.m
//  Sample
//
//  Created by Mac Mini1 on 22/06/15.
//  Copyright (c) 2015 Mac Mini1. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize nameLabel,activityLabel;

- (void)awakeFromNib {
    // Initialization code
  
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];
    self.nameLabel.preferredMaxLayoutWidth = self.nameLabel.frame.size.width;
}


@end

