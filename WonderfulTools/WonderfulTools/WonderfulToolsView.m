//
//  WonderfulToolsView.m
//  WonderfulTools
//
//  Created by Julian Groen on 12/09/2019.
//  Copyright © 2019 Julian Groen. All rights reserved.
//

#import "WonderfulToolsView.h"

@implementation WonderfulToolsView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        NSString* path = [[NSBundle bundleForClass:[self class]] pathForResource:@"WonderfulToolsVideo" ofType:@"mov"];
        NSURL *url = [NSURL fileURLWithPath:path];
        self.player = [AVPlayer playerWithURL:url];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.layer = [[CALayer alloc] init];
        self.wantsLayer = true;
        self.layer.backgroundColor = [[NSColor blackColor] CGColor];
        self.layer.needsDisplayOnBoundsChange = true;
        self.animationTimeInterval = 1 / 30.0;
        self.layer.frame = self.bounds;
        self.playerLayer.frame = self.layer.bounds;
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.playerLayer setAutoresizingMask:kCALayerWidthSizable | kCALayerWidthSizable];
        [self.layer addSublayer:self.playerLayer];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
        [self.player play];
        
    }
    return self;
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}
@end
