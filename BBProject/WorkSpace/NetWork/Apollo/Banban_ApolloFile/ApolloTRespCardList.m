// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFeeCard.jce'
// **********************************************************************

#import "ApolloTRespCardList.h"

@implementation ApolloTRespCardList

@synthesize JV2_PROP_EX(r,0,usableCards,VOApolloTClassFeeCard);
@synthesize JV2_PROP_EX(r,1,unusableCards,VOApolloTClassFeeCard);
@synthesize JV2_PROP_NM(r,2,usableCardsCount);
@synthesize JV2_PROP_NM(o,3,amount);

+ (void)initialize
{
    if (self == [ApolloTRespCardList class]) {
        [ApolloTClassFeeCard initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(usableCards) = DefaultJceArray;
        JV2_PROP(unusableCards) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespCardList";
}

@end
