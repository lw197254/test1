//
//  PlayerView.m
//  AVPlayer
//
//  Created by 刘伟 on 16/6/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "PlayerView.h"
@interface PlayerView()

@property (weak, nonatomic) IBOutlet UIView *vedioView;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *cacheProgressView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end


@implementation PlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithUrlPath:(NSString *)urlPath
{
    self = [[[NSBundle mainBundle]loadNibNamed:@"PlayerView" owner:nil options:nil] firstObject];
    if (self)
    {
        [self setBackgroundColor:[UIColor blackColor]];
        
        
        
        
        
        
        
        
        NSURLComponents *components = [[NSURLComponents alloc] initWithURL:[NSURL URLWithString:urlPath] resolvingAgainstBaseURL:NO];
        components.scheme = @"streaming";
        AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[components URL] options:nil];
        _delegate = [[VideoResourceSupport alloc]initWithURL:[components URL]];
        [asset.resourceLoader setDelegate:self.delegate queue:dispatch_get_main_queue()];
        _playItem = [AVPlayerItem playerItemWithAsset:asset];
        _player = [AVPlayer playerWithPlayerItem:_playItem];
        [_player setVolume:0.5f];
        
        
        
        
        _playLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        [_playLayer setFrame:_vedioView.bounds];
        [_vedioView.layer addSublayer:_playLayer];
           }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.vedioView setFrame:self.bounds];
//    self.playLayer =
}
- (IBAction)pauseClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [_player play];
    }
    else
    {
        [_player pause];
    }

}

- (IBAction)fullScreenClicked:(UIButton *)sender {
}

- (IBAction)vedioClicked:(UITapGestureRecognizer *)sender {
}

- (IBAction)vedioDoubleClicked:(UITapGestureRecognizer *)sender {
}
@end
