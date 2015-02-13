//
//  StringHelper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StringHelper : NSObject

+(NSString *)nilToString:(id)object;
+(BOOL)validateCurrencyValueOnTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
+(BOOL)validatePhoneNumberOnTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
+(BOOL)validatePhoneNumberWithoutDDDOnTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
+(NSString *)stringFromPhoneNumber:(NSNumber *)phoneNumber;
-(NSString *)createJsonStringFromJsonDictionary:(NSDictionary *)jsonDictionary;
-(NSString *)stringFromCurrencyValue:(CGFloat)value;
-(NSString *)stringZipCodeFormatFromZipCodeNumber:(NSNumber *)zipCodeNumber;
-(NSString *)stringByStrippingHTML:(NSString *)s;
-(void)removeLastString:(NSString *)stringToRemove fromMutableString:(NSMutableString *)mutableString;
-(NSString *)timeFormatted:(int)totalSeconds;

@end
