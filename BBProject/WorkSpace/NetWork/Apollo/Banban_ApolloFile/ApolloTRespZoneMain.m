// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTRespZoneMain.h"

@implementation ApolloTRespZoneMain

@synthesize JV2_PROP_EX(r,0,vTops,VOApolloTZoneAdv);
@synthesize JV2_PROP_EX(r,1,vHots,VOApolloTZoneObject);

+ (void)initialize
{
    if (self == [ApolloTRespZoneMain class]) {
        [ApolloTZoneAdv initialize];
        [ApolloTZoneObject initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vTops) = DefaultJceArray;
        JV2_PROP(vHots) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespZoneMain";
}

@end
