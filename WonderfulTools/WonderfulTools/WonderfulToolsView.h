//
//  WonderfulToolsView.h
//  WonderfulTools
//
//  Created by Julian Groen on 12/09/2019.
//  Copyright © 2019 Julian Groen. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <AVFoundation/AVFoundation.h>

@interface WonderfulToolsView : ScreenSaverView
@property (strong) AVPlayer *player;
@property (strong) AVPlayerLayer *playerLayer;
-(void)playerItemDidReachEnd:(NSNotification *)notification;
@end
