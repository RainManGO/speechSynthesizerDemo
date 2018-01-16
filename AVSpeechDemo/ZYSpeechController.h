//
//  ZYSpeechController.h
//  AVSpeechDemo
//
//  Created by apple on 2017/12/6.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ZYSpeechController : UIViewController

@property(nonatomic,strong)AVSpeechSynthesizer * speechSynthesizer;
@property(nonatomic,strong)NSArray * UtteranceTextArray;
@property(nonatomic,strong)NSArray * speechVoices;

#pragma mark Method
+(instancetype)speechManager;
-(void)bulidSettings;
-(void)begainSpeakWitnIndex:(NSUInteger)page;
@end
