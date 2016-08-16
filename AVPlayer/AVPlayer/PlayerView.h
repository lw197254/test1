//
//  PlayerView.h
//  AVPlayer
//
//  Created by 刘伟 on 16/6/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "VideoResourceSupport.h"
@interface PlayerView : UIView

@property(nonatomic,strong,readonly)AVPlayer*player;

@property(nonatomic,strong,readonly)AVPlayerLayer*playLayer;
@property(nonatomic,strong,readonly)AVPlayerItem*playItem;

@property(nonatomic,strong)VideoResourceSupport*delegate;
- (IBAction)pauseClicked:(UIButton *)sender;
- (IBAction)fullScreenClicked:(UIButton *)sender;

- (IBAction)vedioClicked:(UITapGestureRecognizer *)sender;

- (IBAction)vedioDoubleClicked:(UITapGestureRecognizer *)sender;


@end
