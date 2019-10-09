//
//  ASKDelegate.m
//  AppSplitKit
//
//  Created by Felix on 2019/9/25.
//

#import "ASKDelegate.h"
#import "ASManager.h"
#import <objc/runtime.h>

@interface ASKDelegate ()

@property (readwrite, nonatomic, strong) id<UIApplicationDelegate> originDelegate;

@end

@implementation ASKDelegate

+ (instancetype)proxy:(id<UIApplicationDelegate>)delegate {
    return [[self alloc] initWithDelegate:delegate];
}

- (instancetype)initWithDelegate:(id<UIApplicationDelegate>)delegate {
    self = [super init];
    if (self) {
        self.originDelegate = delegate;
        [[ASManager shareManager] setDelegate:self];
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    
    return [_originDelegate respondsToSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    NSMutableArray<id<UIApplicationDelegate>> *apps = [NSMutableArray arrayWithCapacity:20];
    [apps addObject:_originDelegate];
    [apps addObjectsFromArray:(NSMutableArray<id<UIApplicationDelegate>> *)[ASManager apps]];
    
    // return value is type of Bool
    if ('B' == invocation.methodSignature.methodReturnType[0]) {
        BOOL concurrentValue = true;
        for (id<ASAppProtocol> app in apps) {
            if ([(NSObject *)app respondsToSelector:invocation.selector]) {
                [invocation invokeWithTarget:app];
                BOOL returns = true;
                [invocation getReturnValue:&returns];
                concurrentValue = returns?:false;
            }
        }
        [invocation setReturnValue:&concurrentValue];
        return;
    }
    
    for (id<ASAppProtocol> app in apps) {
        
        if ([(NSObject *)app respondsToSelector:invocation.selector]) {
            [invocation invokeWithTarget:app];
        }
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [(NSObject *)_originDelegate methodSignatureForSelector:sel];
}

@end
