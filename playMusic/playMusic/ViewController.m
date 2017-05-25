//
//  ViewController.m
//  playMusic
//
//  Created by CK on 2017/5/24.
//  Copyright © 2017年 CK. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"
@interface ViewController ()
@property(nonatomic,strong)AVAudioPlayer*player; //定义一个player
@property (weak, nonatomic) IBOutlet UISlider *mySlider;

@end

@implementation ViewController

-(AVAudioPlayer *)player{
    if(!_player){
        
        NSString *strPath = [[NSBundle mainBundle]pathForResource:@"2002年的第一场雪" ofType:@"mp3"];
        NSURL* url = [NSURL fileURLWithPath:strPath];
        NSError* err;
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&err];
        [_player prepareToPlay]; //播放前缓存一下
    }
    return _player;
}

- (IBAction)play:(id)sender {
    [self.player play];
}
- (IBAction)stop:(id)sender {
    [self.player stop];
    self.player.currentTime = 0;
}
- (IBAction)pause:(id)sender {
    [self.player pause];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
