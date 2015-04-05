//
//  ViewController.m
//  panelgame
//
//  Created by totta on 2015/04/02.
//  Copyright (c) 2015年 totta. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _myPoint = [UIView new];

// .centerで中心軸を設定
    _myPoint.center = CGPointMake(100, 100);
    
// mypointのサイズの変更
    CGRect myPointSize = _myPoint.frame;
    myPointSize.size.width = 10;
    myPointSize.size.height = 10;
    _myPoint.frame = myPointSize;
    
    _myPoint.backgroundColor = [UIColor redColor];

    float __block x;
    float __block y;


    
    UIView *aaa = [UIView new];
    aaa.frame = CGRectMake(100, 0, 50, 50);
    aaa.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:aaa];
    [self.view addSubview:_myPoint];
    
    _motionManager = [CMMotionManager new];

    if (_motionManager.accelerometerAvailable) {
        // センサーの更新間隔の指定
        _motionManager.accelerometerUpdateInterval = 1 / 10;  // 10Hz
        
        // ハンドラを指定
        CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error) {
            // 画面に表示
            x += data.acceleration.x * 5;
            y += -(data.acceleration.y + 0.4) * 5;
            _myPoint.transform = CGAffineTransformMakeTranslation(x, y);

            if (CGRectIntersectsRect(_myPoint.frame, aaa.frame )){
                NSLog(@"hit");
                
            }

        };
        
        // 加速度の取得開始
        [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
