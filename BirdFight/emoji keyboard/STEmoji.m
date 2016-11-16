//
//  STEmoji.m
//  STEmojiKeyboard
//
//  Created by zhenlintie on 15/5/29.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "STEmoji.h"

@implementation STEmoji
@end

@implementation STEmoji (Generate)

+ (NSDictionary *)emojis{
    static NSDictionary *__emojis = nil;
    if (!__emojis){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"json"];
        NSData *emojiData = [[NSData alloc] initWithContentsOfFile:path];
        __emojis = [NSJSONSerialization JSONObjectWithData:emojiData options:NSJSONReadingAllowFragments error:nil];
    }
    return __emojis;
}

+ (instancetype)peopleEmoji{
    STEmoji *emoji = [STEmoji new];
    emoji.title = @"人物";
    emoji.emojis = [self emojis][@"people"];
    emoji.type = STEmojiTypePeople;
    return emoji;
}

+ (NSArray *)allEmojis{
    return @[[self peopleEmoji]];
}

@end
