//
//  ASManager.h
//  AppSplitKit
//
//  Created by Felix on 2019/9/25.
//

#import <Foundation/Foundation.h>

@protocol ASAppProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface ASManager : NSObject

@property (nonatomic, strong) id delegate;

+ (instancetype)shareManager;

+ (void)registClass:(Class)cls;

+ (NSArray<id<ASAppProtocol>> *)apps;

@end

NS_ASSUME_NONNULL_END
