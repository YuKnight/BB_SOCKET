// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTRespSendSmsInvitation.h"

@implementation ApolloTRespSendSmsInvitation

@synthesize JV2_PROP_EX(r,0,vRegisteredMobilePhones,VONSString);
@synthesize JV2_PROP_EX(r,1,vManyTimesInviteMobilePhones,VONSString);

+ (void)initialize
{
    if (self == [ApolloTRespSendSmsInvitation class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vRegisteredMobilePhones) = DefaultJceArray;
        JV2_PROP(vManyTimesInviteMobilePhones) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespSendSmsInvitation";
}

@end