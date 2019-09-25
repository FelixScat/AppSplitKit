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
}

static void as_swizzleInstanceMethod(Class cls, SEL originalSelector, Class targetCls, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(targetCls, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        as_swizzleInstanceMethod([self class], @selector(setDelegate:), [self class], @selector(as_setDelegate:));
    });
}

@end
