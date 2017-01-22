//
//  TexasHoldemPlayer.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "TexasHoldemPlayer.h"
#import "Hand.h"
#import "PokerHand.h"

@interface TexasHoldemPlayer ()

@end

@implementation TexasHoldemPlayer {
    NSString *_name; // name of the player
}

- (instancetype)init {
    return [self initWithName:@""];
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.privateHand = [[Hand alloc] init];
        _name = name;
    }
    return self;
}

-(NSString *)description {
    return _name;
}

-(PokerHand *)bestHandWithBoardCards:(NSArray *)cards {
    NSAssert(cards.count == 5, @"Board must have five cards");
    // find out best poker hand for all possibilities i.e: using no cards from private hand, using one of them and then using both
    PokerHand *bestHand = [self bestPokerHandForCombinations:cards numberOfForLoops:0 allIndices:[@[@-1,@-1] mutableCopy] current:0 cardsFromPrivate:nil withResults:nil]; // just one possibility using all 5 board cards
    bestHand = [self bestPokerHandForCombinations:cards numberOfForLoops:1 allIndices:[@[@-1,@-1] mutableCopy] current:0 cardsFromPrivate:@[self.privateHand.cards[0]] withResults:bestHand]; // 5 possibilities 5C4
    bestHand = [self bestPokerHandForCombinations:cards numberOfForLoops:1 allIndices:[@[@-1,@-1] mutableCopy] current:0 cardsFromPrivate:@[self.privateHand.cards[1]] withResults:bestHand];
    bestHand = [self bestPokerHandForCombinations:cards numberOfForLoops:2 allIndices:[@[@-1,@-1] mutableCopy] current:0 cardsFromPrivate:self.privateHand.cards withResults:bestHand]; // 10 possibilities 5C3
    return bestHand;
}

-(PokerHand*)bestPokerHandForCombinations:(NSArray*)boardCards
                         numberOfForLoops:(int)loops
                               allIndices:(NSMutableArray*)indices
                                  current:(int)cIndex
                         cardsFromPrivate:(NSArray*)privateCards
                              withResults:(PokerHand*)theHand {
    if (loops == 0) {
        NSMutableArray *possibleCombination = [NSMutableArray new];
        for (int i=0; i<boardCards.count; i++) {
            // skip the cards at index that are in the indices array
            if ([indices containsObject:@(i)]) {
                continue;
            } else {
                [possibleCombination addObject:[boardCards objectAtIndex:i]];
            }
        }
        // add private cards to the combination
        for (int k=0; k<privateCards.count; k++) {
            [possibleCombination addObject:[privateCards objectAtIndex:k]];
        }
        PokerHand *pHand = [[PokerHand alloc] initWithCards:possibleCombination];
        // compare this hand with the current highest one and if this one is higher then use that
        if([pHand compare:theHand] == NSOrderedDescending) {
            theHand = pHand;
            return theHand;
        }
    } else {
        int fromIndex;
        if (cIndex == 0) {
            fromIndex = [[indices objectAtIndex:cIndex] intValue];
        } else {
            // if its not the outermost for loop then use last index+1 as the starting index
            fromIndex = [[indices objectAtIndex:cIndex-1] intValue];
        }
        for (int x = fromIndex+1; x < boardCards.count; x++) {
            [indices replaceObjectAtIndex:cIndex withObject:@(x)]; // update indices array
            theHand = [self bestPokerHandForCombinations:boardCards
                                        numberOfForLoops:loops-1
                                              allIndices:indices
                                                 current:cIndex+1
                                        cardsFromPrivate:privateCards
                                             withResults:theHand];
        }
    }
    return theHand;
}

@end
