//
//  Card.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CardRank)
{
    CardRankTwo,
    CardRankThree,
    CardRankFour,
    CardRankFive,
    CardRankSix,
    CardRankSeven,
    CardRankEight,
    CardRankNine,
    CardRankTen,
    CardRankJack,
    CardRankQueen,
    CardRankKing,
    CardRankAce
};

typedef NS_ENUM(NSInteger, CardSuit)
{
    CardSuitHearts,
    CardSuitDiamonds,
    CardSuitSpades,
    CardSuitClubs
};

@interface Card : NSObject

@property (nonatomic, assign) CardRank rank;
@property (nonatomic, assign) CardSuit suit;

- (instancetype)initWithRank:(CardRank)rank
                     andSuit:(CardSuit)suit;

- (NSComparisonResult)compare:(Card *)other;

@end
