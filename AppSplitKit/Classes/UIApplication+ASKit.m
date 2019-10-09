//
//  UIApplication+ASKit.m
//  AppSplitKit
//
//  Created by Felix on 2019/9/25.
//

#import "UIApplication+ASKit.h"
#import "ASKDelegate.h"
#import <objc/runtime.h>


@implementation UIApplication (ASKit)

- (void)as_setDelegate:(id<UIApplicationDelegate>)delegate {
    
    ASKDelegate *asDelegate = [ASKDelegate proxy:delegate];
    [self as_setDelegate:asDelegate];
    
//    [self as_setDelegate:delegate];
}

static void as_swizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        as_swizzleInstanceMethod(self, @selector(setDelegate:), @selector(as_setDelegate:));
    });
}

@end
