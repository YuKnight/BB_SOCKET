// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTReqOmsResetPwd.h"

@implementation ApolloTReqOmsResetPwd

@synthesize JV2_PROP_NM(r,0,uid);

+ (void)initialize
{
    if (self == [ApolloTReqOmsResetPwd class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqOmsResetPwd";
}

@end
