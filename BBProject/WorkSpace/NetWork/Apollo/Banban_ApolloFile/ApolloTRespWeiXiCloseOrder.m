// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/bank.jce'
// **********************************************************************

#import "ApolloTRespWeiXiCloseOrder.h"

@implementation ApolloTRespWeiXiCloseOrder

@synthesize JV2_PROP_NM(r,0,return_code);
@synthesize JV2_PROP_NM(r,1,out_trade_no);

+ (void)initialize
{
    if (self == [ApolloTRespWeiXiCloseOrder class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(return_code) = DefaultJceString;
        JV2_PROP(out_trade_no) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespWeiXiCloseOrder";
}

@end
