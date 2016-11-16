//
//  NSString+Bird.m
//  BirdFight
//
//  Created by 聚米 on 16/10/13.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "NSString+Bird.h"

@implementation NSString (Bird)

#pragma mark 获取文字长宽方法
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark 获取document路径
+ (NSString *)documentPathWith:(NSString *)fileName
{
    
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
}

#pragma mark 邮件判断
- (BOOL)isEmail
{
    NSString *emailRegex = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
    
}

#pragma mark URL判断
- (BOOL)isUrl
{
    NSString *urlRegex = @"((http|ftp|https)://)?(www.){1}[a-zA-Z0-9]+[.]{1}[\\w]+[/\\w]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
}
#pragma mark 电话号码判断
-(BOOL)isMobilePhoneNumber
{
    NSString *mobilePhoneNumberRegex = @"^[1][3,4,5,6,7,8][0-9]{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobilePhoneNumberRegex];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
    
}

#pragma mark 中英混排长度
-(NSInteger)charLength{
    return [self convertToInt:self];
}

-  (NSInteger)convertToInt:(NSString*)strtemp {
    
    int strlength = 0;
    char *p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
}


@end
