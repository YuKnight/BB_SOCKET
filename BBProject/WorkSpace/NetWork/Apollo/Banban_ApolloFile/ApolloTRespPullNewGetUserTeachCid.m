// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/PullNewUserActivity.jce'
// **********************************************************************

#import "ApolloTRespPullNewGetUserTeachCid.h"

@implementation ApolloTRespPullNewGetUserTeachCid

@synthesize JV2_PROP_EX(r,0,vPNC,VOApolloTPullNewCid);

+ (void)initialize
{
    if (self == [ApolloTRespPullNewGetUserTeachCid class]) {
        [ApolloTPullNewCid initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vPNC) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespPullNewGetUserTeachCid";
}

@end
