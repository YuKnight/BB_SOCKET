// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTReqSendSmsInvitation.h"

@implementation ApolloTReqSendSmsInvitation

@synthesize JV2_PROP_EX(r,0,vMobilePhone,VONSString);
@synthesize JV2_PROP_NM(r,1,content);

+ (void)initialize
{
    if (self == [ApolloTReqSendSmsInvitation class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vMobilePhone) = DefaultJceArray;
        JV2_PROP(content) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqSendSmsInvitation";
}

@end
