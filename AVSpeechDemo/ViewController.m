//
//  ViewController.m
//  AVSpeechDemo
//
//  Created by apple on 2017/12/6.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYSpeechController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVSpeechSynthesizerDelegate>
@property (strong, nonatomic) ZYSpeechController * speechController;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic)NSUInteger page;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self speakImageSetting];
}

-(void)speakImageSetting{
    _speechController = [ZYSpeechController speechManager];
    [_speechController bulidSettings];
    [_speechController begainSpeakWitnIndex:self.page];
    _speechController.speechSynthesizer.delegate = self;
}

- (IBAction)tapNext:(UITapGestureRecognizer *)sender {
    
    [UIView transitionWithView:self.imageView duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        //cycle to next image
                        [self pageCount];
                    }
                    completion:NULL];
}


/**
 切换照片
 */
-(void)pageCount{
    if (self.page<4) {
        self.page++;
    }else{
       self.page =1;
    }
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"p%lu",(unsigned long)self.page]];
    [_speechController begainSpeakWitnIndex:self.page];
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    if ([utterance.speechString isEqualToString:@"/n"]) {
        [self tapNext:nil];
    }
}

@end
