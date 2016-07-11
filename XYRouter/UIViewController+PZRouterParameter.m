//
//  UIViewController+PZRouterParameter.m
//  XYRouterDemo
//
//  Created by phil zhang on 16/7/11.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "UIViewController+PZRouterParameter.h"

@implementation UIViewController (PZRouterParameter)

- (void)pzEncodeParameter:(NSString *)parameter
{
    NSArray *paramters = [parameter componentsSeparatedByString:@"&"];
    [parameter enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
        NSArray *param = [line componentsSeparatedByString:@"="];
        @try {
            [self setValue:param.lastObject forKeyPath:param.firstObject];
        }
        @catch (NSException *exception) {
            NSLog(@"%@, %@, %@", self, param.firstObject, param.lastObject);
        }
        @finally {
            
        }
    }];
}

@end
