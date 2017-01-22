//
//  TheGame.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "TheGame.h"

@interface TheGame() {
    NSUserDefaults* _userDefaults;
}

@end

@implementation TheGame

+ (TheGame*) sharedGame {
    static TheGame* sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] initWithUserDefaults:[NSUserDefaults standardUserDefaults]];
    });
    return sharedInstance;
}

- (TheGame*)initWithUserDefaults:(NSUserDefaults*)userDefaults {
    self = [super init];
    _userDefaults = userDefaults;
    return self;
}

@end
