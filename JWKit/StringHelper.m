//
//  StringHelper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper

+(NSString *)nilToString:(id)object {
    
    if ( object == nil ) {
        object = @"";
    }
    
    return object;
    
}

+(BOOL)validateCurrencyValueOnTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSRange commaRange = [textField.text rangeOfString:@","];
    
    if ( [string isEqualToString:@"."] ) {
        
        if ( commaRange.location != NSNotFound ) {
            return NO;
        }
        
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString: @","];
        
        return NO;
        
    } else {
        
        if ( commaRange.location != NSNotFound ) {
            
            NSString *substring = [textField.text substringFromIndex:textField.text.length - 2];
            
            if ( [substring rangeOfString:@","].location == NSNotFound && ( ! [string isEqualToString:@""] ) ) {
                return NO;
            }
            
        }
        
    }
    
    return YES;
    
}

+(BOOL)validatePhoneNumberOnTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    BOOL backupSpacePressed = [string isEqualToString:@""];
    
    NSString *stringPhone = nil;
    
    if ( backupSpacePressed ) {
        stringPhone = [textField.text stringByReplacingCharactersInRange:range withString:string];
    } else {
        stringPhone = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@" " withString:@""];
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@"(" withString:@""];
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@")" withString:@""];
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    // Validate Phone field to show only 12 digits on max.
    if ( stringPhone.length >= 12 && ! ( backupSpacePressed ) ) {
        return NO;
    }
    
    NSString *stringHelper = [StringHelper stringFromPhoneNumber:[NSNumber numberWithLongLong:[stringPhone longLongValue]]];
    
    if ( [stringHelper isEqualToString:stringPhone] ) {
        return YES;
    } else {
        textField.text = stringPhone;
        return NO;
    }
    
}

+(BOOL)validatePhoneNumberWithoutDDDOnTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    BOOL backupSpacePressed = [string isEqualToString:@""];
    
    NSString *stringPhone = nil;
    
    if ( backupSpacePressed ) {
        stringPhone = [textField.text stringByReplacingCharactersInRange:range withString:string];
    } else {
        stringPhone = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@" " withString:@""];
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@"(" withString:@""];
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@")" withString:@""];
    stringPhone = [stringPhone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    // Validate Phone field to show only 9 digits on max.
    if ( stringPhone.length >= 10 && ! ( backupSpacePressed ) ) {
        return NO;
    }
    
    NSString *stringHelper = [StringHelper stringFromPhoneNumber:[NSNumber numberWithLongLong:[stringPhone longLongValue]]];
    
    if ( [stringHelper isEqualToString:stringPhone] ) {
        return YES;
    } else {
        textField.text = stringPhone;
        return NO;
    }
    
}

+(NSString *)stringFromPhoneNumber:(NSNumber *)phoneNumber {
    
    NSString *stringPhone = [NSString stringWithFormat:@"%lld",[phoneNumber longLongValue]];
    
    if ( stringPhone.length >= 4 && stringPhone.length < 10 ) {
        
        int lengthOfSubstring1 = (int)stringPhone.length - 1;
        int lengthOfSubstring2 = 1;
        
        if ( stringPhone.length >= 5 && stringPhone.length <= 7 ) {
            
            lengthOfSubstring1 = 3;
            lengthOfSubstring2 = (int)stringPhone.length - 3;
            
        } else if ( stringPhone.length >= 8 ) {
            
            lengthOfSubstring1 = (int)stringPhone.length - 4;
            lengthOfSubstring2 = 4;
            
        }
        
        NSString *substring1 = [stringPhone substringWithRange:NSMakeRange( 0, lengthOfSubstring1 )];
        NSString *substring2 = [stringPhone substringWithRange:NSMakeRange( lengthOfSubstring1, lengthOfSubstring2 )];
        
        stringPhone = [NSString stringWithFormat:@"%@-%@",substring1,substring2];
        
        return stringPhone;
        
    } else if ( stringPhone.length == 10 || stringPhone.length == 11 ) {
        
        // Variable created because of the ninth digit
        int lengthOfSubstring2 = (int)stringPhone.length - 6;
        
        NSString *substring1 = [stringPhone substringWithRange:NSMakeRange( 0, 2 )];
        NSString *substring2 = [stringPhone substringWithRange:NSMakeRange( 2, lengthOfSubstring2 )];
        NSString *substring3 = [stringPhone substringWithRange:NSMakeRange( stringPhone.length-4, 4 )];
        
        stringPhone = [NSString stringWithFormat:@"(%@) %@-%@",substring1,substring2,substring3];
        
    }
    
    return stringPhone;
    
}

-(NSString *)createJsonStringFromJsonDictionary:(NSDictionary *)jsonDictionary {
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:0 error:&error];
    
    NSString *jsonString;
    
    if ( ! jsonData ) {
        
        NSLog( @"Got an error: %@", error );
        
        return nil;
        
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
    
}

-(NSString *)stringFromCurrencyValue:(CGFloat)value {
    
    NSString *stringValue = [NSString stringWithFormat:@"R$ %.2f",value];
    stringValue = [stringValue stringByReplacingOccurrencesOfString:@"." withString:@","];
    
    return stringValue;
    
}

-(NSString *)stringZipCodeFormatFromZipCodeNumber:(NSNumber *)zipCodeNumber {
    
    NSString *zipCodeString = [zipCodeNumber stringValue];
    
    if ( zipCodeString.length < 8 ) {
        return @"0";
    }
    
    NSString *stringFirstPart = [zipCodeString substringWithRange:NSMakeRange(0, 5)];
    NSString *stringSecondPart = [zipCodeString substringWithRange:NSMakeRange(5, 3)];
    
    zipCodeString = [NSString stringWithFormat:@"%@-%@", stringFirstPart, stringSecondPart];
    
    return zipCodeString;
    
}

-(NSString *)stringByStrippingHTML:(NSString *)s {
    
    NSRange r;
    
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    
    s = [s stringByReplacingOccurrencesOfString:@"&lt;" withString:@""];
    s = [s stringByReplacingOccurrencesOfString:@"&gt;" withString:@""];
    s = [s stringByReplacingOccurrencesOfString:@"/strong" withString:@""];
    s = [s stringByReplacingOccurrencesOfString:@"strong" withString:@""];
    
    return s;
    
}

-(void)removeLastString:(NSString *)stringToRemove fromMutableString:(NSMutableString *)mutableString {
    
    // Removing the last string
    if ( ! [mutableString isEqualToString:@""] ) {
        
        NSString *lastChar = [mutableString substringFromIndex:mutableString.length - stringToRemove.length];
        
        if ( [lastChar isEqualToString:stringToRemove] ) {
            [mutableString replaceCharactersInRange:NSMakeRange(mutableString.length-stringToRemove.length, stringToRemove.length) withString:@""];
        }
        
    }
    
}

-(NSString *)timeFormatted:(int)totalSeconds {
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    
}

-(NSString *)stringPhoneNumberOnlyNumbers:(NSString *)rawPhoneNumber {
    
    NSString *onlyNumbers = [rawPhoneNumber copy];
    
    onlyNumbers = [onlyNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
    onlyNumbers = [onlyNumbers stringByReplacingOccurrencesOfString:@"(" withString:@""];
    onlyNumbers = [onlyNumbers stringByReplacingOccurrencesOfString:@")" withString:@""];
    onlyNumbers = [onlyNumbers stringByReplacingOccurrencesOfString:@"-" withString:@""];
    onlyNumbers = [onlyNumbers stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    return onlyNumbers;
    
}

-(NSAttributedString *)attributedStringStrikedInString:(NSString *)string {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:(string ? string : @"")];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, [attributeString length])];
    
    return attributeString;
    
}

@end
