// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFeeCard.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTClassFeeCard.h"

@interface ApolloTRespCardList : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(usableCards,setUsableCards:)) NSArray* JV2_PROP_EX(r,0,usableCards,VOApolloTClassFeeCard);
@property (nonatomic, retain, JV2_PROP_GS_V2(unusableCards,setUnusableCards:)) NSArray* JV2_PROP_EX(r,1,unusableCards,VOApolloTClassFeeCard);
@property (nonatomic, assign, JV2_PROP_GS_V2(usableCardsCount,setUsableCardsCount:)) JceInt32 JV2_PROP_NM(r,2,usableCardsCount);
@property (nonatomic, assign, JV2_PROP_GS_V2(amount,setAmount:)) JceInt32 JV2_PROP_NM(o,3,amount);

@end
