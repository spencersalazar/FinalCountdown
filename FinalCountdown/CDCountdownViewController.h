//
//  CDViewController.h
//  Countdown
//
//  Created by Spencer Salazar on 3/19/14.
//  Copyright (c) 2014 Spencer Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDView.h"

@interface CDCountdownViewController : UIViewController

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDate *date;

@end
