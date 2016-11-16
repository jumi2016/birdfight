//
//  BaseMethod.h
//  拉拉 (product)
//
//  Created by 岳淑霞 on 16/3/31.
//  Copyright © 2016年 岳淑霞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#import <sys/utsname.h>
#import <CoreLocation/CoreLocation.h>


@interface BaseMethod : NSObject

//判断距离是否超过了一千米
+(NSString *)getNormalDistanceWith:(NSString *)str;

//判断数字是否超过了一万
+(NSString *)getNormalCountWith:(NSString *)str;

//根据日期判断星座
+ (NSString *)getAstroWithMongth:(int)m Day:(int)d;

//获取手机系统版本
+ (NSString *)getiphoneType;

//获取手机经纬度（在登录时获取手机经纬度）
//获取百度API取具体地址（在登录时获取具体地址）
//计算两点（经纬度）位置之间的距离
+ (double)getDistanceWithlocationA:(CLLocation *)locA AndlocationB:(CLLocation *)locB;

//手机登录，获取真实IP地址，避免WiFi等局域网
+ (NSString *)deviceWANIPAdress;

//md5注册，登录密码加密
+ (NSString *)createMD5:(NSString *)signString;

//用户密码本地存储（自动登录）加密
+ (NSString *)encode:(NSString *)str key:(NSString *)key;

//用户密码本地存储（自动登录）解密
+ (NSString *)decode:(NSString *)str key:(NSString *)key;

//base64编码(图片，录音，视频)
+ (NSString *)base64FromImage:(UIImage *)image;
+ (NSString *)base64FromMedia:(NSURL *)url;


//图片格式转换
+ (UIImage *)BmpToJpeg:(UIImage *)image;

//图片格式判断
+ (NSString *)TypeWithImage:(NSData *)data;
+ (NSData *)judgeImageType:(NSString *)str withImage:(UIImage *)image;

//图片大小压缩
+(UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

//图片转字符串
+(NSString *)UIImageToBase64Str:(UIImage *) image;
//字符串转图片
+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;

//取文件扩展名
+ (NSString *)filePathExtension:(NSString *)fileName;

//获取当前时间（时分秒毫秒）
+ (NSString *)currentTime;

@end
