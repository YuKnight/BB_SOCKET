// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/bank.jce'
// **********************************************************************

#import "ApolloTReqWeiXiCloseOrder.h"

@implementation ApolloTReqWeiXiCloseOrder

@synthesize JV2_PROP_NM(o,0,out_trade_no);

+ (void)initialize
{
    if (self == [ApolloTReqWeiXiCloseOrder class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(out_trade_no) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqWeiXiCloseOrder";
}

@end
