//
//  ViewController.h
//  panelgame
//
//  Created by totta on 2015/04/02.
//  Copyright (c) 2015年 totta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface GameViewController : UIViewController
@property (nonatomic, retain) CMMotionManager *motionManager;
@property (nonatomic, retain) UIView *myPoint;

@end

