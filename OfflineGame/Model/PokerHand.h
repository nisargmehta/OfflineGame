//
//  PokerHand.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "Hand.h"

typedef NS_ENUM(NSInteger, PokerHandType)
{
  PokerHandTypeHighCard,
  PokerHandTypeOnePair,
  PokerHandTypeTwoPair,
  PokerHandTypeThreeOfAKind,
  PokerHandTypeStraight,
  PokerHandTypeFlush,
  PokerHandTypeFullHouse,
  PokerHandTypeFourOfAKind,
  PokerHandTypeStraightFlush
};

@interface PokerHand : Hand

@property (nonatomic, assign) PokerHandType handType;

- (NSComparisonResult)compare:(PokerHand *)other;

@end
