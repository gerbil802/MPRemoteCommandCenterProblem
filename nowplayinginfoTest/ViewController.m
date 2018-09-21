//
//  ViewController.m
//  nowplayinginfoTest
//
//  Created by Tal Shrestha on 13/09/2018.
//  Copyright © 2018 Tal Shrestha. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@import MediaPlayer;
@import AVFoundation;

@interface ViewController ()

@property (strong, readwrite) NSTimer* timer;
@property (strong, readwrite) AVAudioPlayer* player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary* mediaInfo = @{ MPMediaItemPropertyArtist:@"Hello world",
                                 MPNowPlayingInfoPropertyPlaybackRate:@1.0,
                                 MPNowPlayingInfoPropertyIsLiveStream:@1.0
                                 };
    [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = mediaInfo;

    NSString* soundPath = nil;
    soundPath = [[NSBundle mainBundle] pathForResource:@"code" ofType:@"mp3"];
    NSURL* url = [NSURL URLWithString:soundPath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.player.numberOfLoops = -1; //Infinite
    [self.player play];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
