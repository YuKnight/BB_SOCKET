// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTReqZoneAccusation.h"

@implementation ApolloTReqZoneAccusation

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,msgid);
@synthesize JV2_PROP_NM(r,2,type);

+ (void)initialize
{
    if (self == [ApolloTReqZoneAccusation class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(msgid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqZoneAccusation";
}

@end
