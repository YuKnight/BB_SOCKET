// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "ApolloTRespGetNoticeMsg.h"

@implementation ApolloTRespGetNoticeMsg

@synthesize JV2_PROP_EX(r,0,vNoticeMsg,VOApolloTNoticeMessage);
@synthesize JV2_PROP_NM(r,1,count);
@synthesize JV2_PROP_NM(r,2,total);

+ (void)initialize
{
    if (self == [ApolloTRespGetNoticeMsg class]) {
        [ApolloTNoticeMessage initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vNoticeMsg) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespGetNoticeMsg";
}

@end
