//
//  ASManager.m
//  AppSplitKit
//
//  Created by Felix on 2019/9/25.
//

#import "ASManager.h"
#import "ASAppProtocol.h"

static NSMutableArray<id<ASAppProtocol>> * _asApps;

@implementation ASManager

static ASManager *mgr = nil;

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[self alloc] init];
        _asApps = [NSMutableArray arrayWithCapacity:13];
    });
    return mgr;
}

+ (void)registClass:(Class)cls {
    
    return [[self shareManager] registClass:cls];
}

+ (NSArray<id<ASAppProtocol>> *)apps {
    return _asApps;
}

- (void)registClass:(Class)cls {
    assert([cls conformsToProtocol:@protocol(ASAppProtocol)]);
    [_asApps addObject:[[cls alloc] init]];
}

@end
