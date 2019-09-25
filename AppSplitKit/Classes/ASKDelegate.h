//
//  ASKDelegate.h
//  AppSplitKit
//
//  Created by Felix on 2019/9/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASKDelegate : NSProxy <UIApplicationDelegate>

@property (readonly, nonatomic, strong) id<UIApplicationDelegate> originDelegate;

+ (instancetype)proxy:(id<UIApplicationDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
