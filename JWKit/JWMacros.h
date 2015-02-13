//
//  JWMacros.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

void runOnMainQueueSync(void (^block)(void));
void runOnMainQueueAsync(void (^block)(void));
void runOnBackgroundQueue(void (^block)(void));

@interface JWMacros : NSObject

#define JW_isIPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define JW_isIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define JW_isRetinaDevice ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] >= 2)
#define JW_isMultiTaskingSupported ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)] && [[UIDevice currentDevice] isMultitaskingSupported])

#define JW_runOnMainThread if (![NSThread isMainThread]) { dispatch_sync(dispatch_get_main_queue(), ^{ [self performSelector:_cmd]; }); return; };

#define JW_rgba(r,g,b,a)				[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define JW_rgb(r,g,b)					JW_rgba(r, g, b, 1.0f)

#ifdef DEBUG
#define JW_log( s, ... ) DDLogInfo( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define JW_log( s, ... )
#endif

#define JW_logBounds(view) UA_log(@"%@ bounds: %@", view, NSStringFromRect([view bounds]))
#define JW_logFrame(view)  UA_log(@"%@ frame: %@", view, NSStringFromRect([view frame]))

#define NSStringFromBool(b) (b ? @"YES" : @"NO")

#define JW_SHOW_VIEW_BORDERS YES
#define JW_showDebugBorderForViewColor(view, color) if (JW_SHOW_VIEW_BORDERS) { view.layer.borderColor = color.CGColor; view.layer.borderWidth = 1.0; }
#define JW_showDebugBorderForView(view) JW_showDebugBorderForViewColor(view, [UIColor colorWithWhite:0.0 alpha:0.25])

#define DegreesToRadians(x) ((x) * M_PI / 180.0)

// Set the flag for a block completion handler
#define StartBlock() __block BOOL waitingForBlock = YES

// Set the flag to stop the loop
#define EndBlock() waitingForBlock = NO

// Wait and loop until flag is set
#define WaitUntilBlockCompletes() WaitWhile(waitingForBlock)

// Macro - Wait for condition to be NO/false in blocks and asynchronous calls
#define WaitWhile(condition) \
do { \
while(condition) { \
[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]]; \
} \
} while(0)

@end