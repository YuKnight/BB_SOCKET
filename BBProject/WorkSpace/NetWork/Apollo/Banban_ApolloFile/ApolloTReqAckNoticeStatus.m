// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "ApolloTReqAckNoticeStatus.h"

@implementation ApolloTReqAckNoticeStatus

@synthesize JV2_PROP_NM(r,0,noticeid);
@synthesize JV2_PROP_NM(r,1,uid);
@synthesize JV2_PROP_NM(r,2,tagid);
@synthesize JV2_PROP_NM(r,3,flag);

+ (void)initialize
{
    if (self == [ApolloTReqAckNoticeStatus class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(noticeid) = DefaultJceString;
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(tagid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqAckNoticeStatus";
}

@end