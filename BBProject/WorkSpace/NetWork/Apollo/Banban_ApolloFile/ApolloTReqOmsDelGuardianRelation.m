// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTReqOmsDelGuardianRelation.h"

@implementation ApolloTReqOmsDelGuardianRelation

@synthesize JV2_PROP_NM(r,0,studentid);
@synthesize JV2_PROP_NM(r,1,guardianuid);

+ (void)initialize
{
    if (self == [ApolloTReqOmsDelGuardianRelation class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(studentid) = DefaultJceString;
        JV2_PROP(guardianuid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqOmsDelGuardianRelation";
}

@end
