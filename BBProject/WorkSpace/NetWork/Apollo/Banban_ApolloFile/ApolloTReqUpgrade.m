// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Upgrade.jce'
// **********************************************************************

#import "ApolloTReqUpgrade.h"

@implementation ApolloTReqUpgrade

@synthesize JV2_PROP_NM(r,0,iClientType);
@synthesize JV2_PROP_NM(r,1,strAppVer);
@synthesize JV2_PROP_NM(r,2,sUid);

+ (void)initialize
{
    if (self == [ApolloTReqUpgrade class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(strAppVer) = DefaultJceString;
        JV2_PROP(sUid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqUpgrade";
}

@end
