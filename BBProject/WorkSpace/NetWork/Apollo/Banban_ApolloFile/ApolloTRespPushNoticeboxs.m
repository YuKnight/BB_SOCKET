// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "ApolloTRespPushNoticeboxs.h"

@implementation ApolloTRespPushNoticeboxs

@synthesize JV2_PROP_EX(r,0,vrespIndex,VOApolloTClientReceiveNoticeIndex);

+ (void)initialize
{
    if (self == [ApolloTRespPushNoticeboxs class]) {
        [ApolloTClientReceiveNoticeIndex initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vrespIndex) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespPushNoticeboxs";
}

@end
