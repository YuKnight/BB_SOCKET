// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/login.jce'
// **********************************************************************

#import "ApolloTRespLoginRegister.h"

@implementation ApolloTRespLoginRegister

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,sToken);
@synthesize JV2_PROP_NM(r,2,lTime);
@synthesize JV2_PROP_NM(o,3,sDotNetDomain);
@synthesize JV2_PROP_NM(o,4,sApolloDomain);
@synthesize JV2_PROP_NM(o,5,sDotNetIPPort);
@synthesize JV2_PROP_NM(o,6,sApolloIPPort);
@synthesize JV2_PROP_NM(r,7,identity);
@synthesize JV2_PROP_NM(r,8,isnewuser);
@synthesize JV2_PROP_NM(o,9,banban);

+ (void)initialize
{
    if (self == [ApolloTRespLoginRegister class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(sToken) = DefaultJceString;
        JV2_PROP(sDotNetDomain) = DefaultJceString;
        JV2_PROP(sApolloDomain) = DefaultJceString;
        JV2_PROP(sDotNetIPPort) = DefaultJceString;
        JV2_PROP(sApolloIPPort) = DefaultJceString;
        JV2_PROP(banban) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespLoginRegister";
}

@end
