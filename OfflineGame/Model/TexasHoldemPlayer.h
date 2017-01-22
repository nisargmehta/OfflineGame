//
//  TexasHoldemPlayer.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hand, PokerHand;

@interface TexasHoldemPlayer : NSObject

@property (nonatomic, strong) Hand *privateHand;

- (instancetype)initWithName:(NSString *)name;
- (PokerHand *)bestHandWithBoardCards:(NSArray *)cards;

@end
