//
//  ZYSpeechController.m
//  AVSpeechDemo
//
//  Created by apple on 2017/12/6.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ZYSpeechController.h"

@interface ZYSpeechController ()

@end

@implementation ZYSpeechController

+(instancetype)speechManager{
    static ZYSpeechController * speechController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        speechController    =  [[self alloc]init];
    });
    
    return speechController;
}

-(void)bulidSettings{
    _speechSynthesizer  =  [AVSpeechSynthesizer new];
    _speechVoices       =  @[[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"],[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-TW"]];
    _UtteranceTextArray =  [self bulidStringsArray];
}

-(NSArray *)bulidStringsArray{
    return @[@[@"干哈呀",@"王师傅，你家亲戚来找你了。",@"老板让你回去。",@"王胖子叔叔，",@"我爸爸是王瘸子，他让我来帝京找你当 学徒",@"/n"],@[@"咋！不认识我了？",@"我是王小二呀，咱们都不是王八屯的吗。",@"王胖子也是你叫的吗？",@"我知道你是个小混混，要不是你爸求我，我才不管你呢，",@"谢谢王叔收我为徒。",@"谢我没有用，收不收你要老板娘同意才行。",@"老板？",@"/n"],@[@"啥同不同意的，王师傅的小老乡哪能不要啊。",@"后厨正缺帮手呢。",@"哟，小伙张的还挺精神",@"给王师傅打下手，包吃包住，学徒期间一个月八百，行不？",@"行",@"/n"],@[@"难道老板娘又想老牛吃嫩草了？",@"我还没有受宠过呢。",@"你爸没有让你带什么东西吗？",@"啊，有，我差点忘了。",@"给，我爸说一次只能泡一片，不能多放。",@"/n"]];
}

-(void)begainSpeakWitnIndex:(NSUInteger)page{
    [_speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    NSArray * pageStrings = _UtteranceTextArray[page-1];
    for (NSUInteger i = 0; i < pageStrings.count; i++) {
        AVSpeechUtterance *utterance =
        [[AVSpeechUtterance alloc] initWithString:pageStrings[i]];
        utterance.voice = _speechVoices[i % 2];
        utterance.rate = 0.5f;
        utterance.pitchMultiplier = 0.8f;
        utterance.postUtteranceDelay = 0.1f;
        [self.speechSynthesizer speakUtterance:utterance];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
