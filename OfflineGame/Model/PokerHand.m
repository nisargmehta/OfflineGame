//
//  PokerHand.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "PokerHand.h"
#import "Card.h"

@interface PokerHand ()

@end

@implementation PokerHand

- (instancetype)initWithCards:(NSArray *)cards {
    NSAssert(cards.count == 5, @"Poker hands must be five cards");
    
    return [super initWithCards:cards];
}

-(PokerHandType)handType {
    if ([self checkForStarightFlush])
        return PokerHandTypeStraightFlush;
    else if ([self checkForFourOfAKind])
        return PokerHandTypeFourOfAKind;
    else if ([self checkForFullHouse])
        return PokerHandTypeFullHouse;
    else if ([self checkForFlush])
        return PokerHandTypeFlush;
    else if ([self checkForStraight])
        return PokerHandTypeStraight;
    else if ([self checkForThreeOfAKind])
        return PokerHandTypeThreeOfAKind;
    else if ([self checkForTwoPair])
        return PokerHandTypeTwoPair;
    else if ([self checkForOnePair])
        return PokerHandTypeOnePair;
    else return PokerHandTypeHighCard;
}

-(NSComparisonResult)compare:(PokerHand *)other {
    if (self.handType == other.handType) {
        return [self findHighestHand:self and:other];
    }
    return [@(self.handType) compare:@(other.handType)];
}

# pragma mark - Helpers

-(NSComparisonResult)findHighestHand:(PokerHand*)handOne and:(PokerHand*)handTwo {
    if ([handOne isEqual:handTwo]) {
        return NSOrderedSame;
    }
    NSDictionary *firstDict = [self getRankDictionary:handOne.cards];
    NSDictionary *secondDict = [self getRankDictionary:handTwo.cards];
    // get keys by value, sort them, add to an array
    NSMutableArray *arrayForOne = [NSMutableArray new];
    NSMutableArray *arrayForTwo = [NSMutableArray new];
    // the hand can possibly have from 1 occurance of a card to 4 occurances
    for (int i=1; i<=4; i++) {
        // ranks of each hand sorted by occurance and if there are multiple ranks of the same occurance they are sorted  
        [arrayForOne addObjectsFromArray:[[firstDict allKeysForObject:@(i)] sortedArrayUsingSelector:@selector(compare:)]];
        [arrayForTwo addObjectsFromArray:[[secondDict allKeysForObject:@(i)] sortedArrayUsingSelector:@selector(compare:)]];
    }
    for (int i=(int)arrayForOne.count-1; i>=0; i--) {
        CardRank *one = (CardRank*)[[arrayForOne objectAtIndex:i] integerValue];
        CardRank *two = (CardRank*)[[arrayForTwo objectAtIndex:i] integerValue];
        if (one > two) {
            return NSOrderedDescending;
        } else if (one < two) {
            return NSOrderedAscending;
        } else {
            continue;
        }
    }
    return NSOrderedSame;
}

// rank dictionary has ranks in the hand as the key and its occurance as value
-(NSDictionary*)getRankDictionary:(NSArray*)cards {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for(Card *card in cards) {
        if ([dict objectForKey:@(card.rank)]) {
            [dict setObject:@([[dict objectForKey:@(card.rank)] integerValue]+1) forKey:@(card.rank)];
        } else {
            [dict setObject:@(1) forKey:@(card.rank)];
        }
    }
    return dict;
}

-(BOOL)checkIfRankDictionaryHas:(int)enteries forObject:(int)num andTimes:(int)times {
    NSDictionary *rankDict = [self getRankDictionary:self.cards];
    // enteries in the dictionary
    if (rankDict.count != enteries) {
        return NO;
    }
    if ([rankDict allKeysForObject:@(num)].count != times) {
        return NO;
    }
    return YES;
}

# pragma mark - checks for all poker hand types

-(BOOL)checkForStarightFlush {
    if (![self checkForFlush]) {
        return NO;
    }
    if (![self checkForStraight]) {
        return NO;
    }
    return YES;
}

-(BOOL)checkForFourOfAKind {
    return [self checkIfRankDictionaryHas:2 forObject:4 andTimes:1];
}

-(BOOL)checkForFullHouse {
    return [self checkIfRankDictionaryHas:2 forObject:3 andTimes:1];
}

-(BOOL)checkForFlush {
    Card *first = [self.cards objectAtIndex:0];
    for (Card *card in self.cards) {
        if (card.suit != first.suit) {
            return NO;
        }
    }
    return YES;
}

-(BOOL)checkForStraight {
    [self.cards sortUsingSelector:@selector(compare:)];
    for (int i=0; i<self.cards.count-1; i++) {
        Card *current = [self.cards objectAtIndex:i];
        Card *next = [self.cards objectAtIndex:i+1];
        if (next.rank - current.rank != 1) {
            return NO;
        }
    }
    return YES;
}

-(BOOL)checkForThreeOfAKind {
    return [self checkIfRankDictionaryHas:3 forObject:3 andTimes:1];
}

-(BOOL)checkForTwoPair {
    return [self checkIfRankDictionaryHas:3 forObject:2 andTimes:2];
}

-(BOOL)checkForOnePair {
    return [self checkIfRankDictionaryHas:4 forObject:2 andTimes:1];
}

@end
