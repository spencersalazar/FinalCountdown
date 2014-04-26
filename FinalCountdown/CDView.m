//
//  CDView.m
//  Countdown
//
//  Created by Spencer Salazar on 3/19/14.
//  Copyright (c) 2014 Spencer Salazar. All rights reserved.
//

#import "CDView.h"

@interface CDView ()

@property (strong, nonatomic) UIFont *font;

@end

@implementation CDView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if(self.font == nil) self.font = [UIFont fontWithName:@"Comic Sans MS" size:54];
    
    [[UIColor redColor] set];
    
    // Drawing code
    [self.text drawInRect:self.bounds
                 withFont:self.font
            lineBreakMode:NSLineBreakByWordWrapping
                alignment:NSTextAlignmentCenter];
}


@end
