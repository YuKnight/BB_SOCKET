// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTRespZoneMsgDetail.h"

@implementation ApolloTRespZoneMsgDetail

@synthesize JV2_PROP_NM(r,0,conent);
@synthesize JV2_PROP_EX(r,1,comments,VOApolloTZoneComment);
@synthesize JV2_PROP_EX(r,2,likers,VOApolloTZoneLikerObject);
@synthesize JV2_PROP_NM(o,3,msg);
@synthesize JV2_PROP_EX(o,4,hotComments,VOApolloTZoneComment);

+ (void)initialize
{
    if (self == [ApolloTRespZoneMsgDetail class]) {
        [ApolloTZoneComment initialize];
        [ApolloTZoneLikerObject initialize];
        [ApolloTZoneMsg initialize];
        [ApolloTZoneMsgContent initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(conent) = [ApolloTZoneMsgContent object];
        JV2_PROP(comments) = DefaultJceArray;
        JV2_PROP(likers) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespZoneMsgDetail";
}

@end
