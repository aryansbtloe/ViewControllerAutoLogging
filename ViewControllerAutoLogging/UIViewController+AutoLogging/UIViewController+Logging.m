//
//  UIViewController+Logging.m
//  UIViewController (Logging)
//
//  Created by Alok Kumar Singh on 09/10/15.
//  Copyright © 2015 Alok Kumar Singh. All rights reserved.
//


#import "UIViewController+Logging.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation UIViewController (Logging)

+ (void)load {
    static dispatch_once_t once_token;
    dispatch_once(&once_token,  ^{
        {
            Method originalMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
            Method extendedMethod = class_getInstanceMethod(self, @selector(loggedEnabledViewDidLoad));
            method_exchangeImplementations(originalMethod, extendedMethod);
        }
        {
            Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
            Method extendedMethod = class_getInstanceMethod(self, @selector(loggedEnabledViewWillAppear:));
            method_exchangeImplementations(originalMethod, extendedMethod);
        }
        {
            Method originalMethod = class_getInstanceMethod(self, @selector(viewDidAppear:));
            Method extendedMethod = class_getInstanceMethod(self, @selector(loggedEnabledViewDidAppear:));
            method_exchangeImplementations(originalMethod, extendedMethod);
        }
        {
            Method originalMethod = class_getInstanceMethod(self, @selector(ViewWillDisappear));
            Method extendedMethod = class_getInstanceMethod(self, @selector(loggedEnabledViewWillDisappear));
            method_exchangeImplementations(originalMethod, extendedMethod);
        }
        {
            Method originalMethod = class_getInstanceMethod(self, @selector(viewDidDisappear:));
            Method extendedMethod = class_getInstanceMethod(self, @selector(loggedEnabledViewDidDisappear:));
            method_exchangeImplementations(originalMethod, extendedMethod);
        }
        {
            Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
            Method extendedMethod = class_getInstanceMethod(self, @selector(loggedEnabledDealloc));
            method_exchangeImplementations(originalMethod, extendedMethod);
        }
    });
}

- (void) loggedEnabledViewDidLoad {
    NSLog(@"viewDidLoad : %@", [self class]);
    [self loggedEnabledViewDidLoad];
}

- (void) loggedEnabledViewWillAppear:(BOOL)animated {
    NSLog(@"ViewWillAppear : %@", [self class]);
    [self loggedEnabledViewWillAppear:animated];
}

- (void) loggedEnabledViewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear : %@", [self class]);
    [self loggedEnabledViewDidAppear:animated];
}

- (void) loggedEnabledViewWillDisappear {
    NSLog(@"ViewWillDisappear : %@", [self class]);
    [self loggedEnabledViewWillDisappear];
}

- (void) loggedEnabledViewDidDisappear:(BOOL)animated {
    NSLog(@"ViewDidDisappear : %@", [self class]);
    [self loggedEnabledViewDidDisappear:animated];
}

- (void) loggedEnabledDealloc {
    NSLog(@"Dealloc : %@", [self class]);
    [self loggedEnabledDealloc];
}

@end