// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "ApolloTReqGetSendedNotices.h"

@implementation ApolloTReqGetSendedNotices

@synthesize JV2_PROP_NM(r,0,flag);
@synthesize JV2_PROP_NM(r,1,index);
@synthesize JV2_PROP_NM(r,2,uid);
@synthesize JV2_PROP_NM(r,3,clientType);

+ (void)initialize
{
    if (self == [ApolloTReqGetSendedNotices class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqGetSendedNotices";
}

@end
