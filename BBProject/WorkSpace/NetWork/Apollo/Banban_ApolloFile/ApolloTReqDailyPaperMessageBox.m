// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTReqDailyPaperMessageBox.h"

@implementation ApolloTReqDailyPaperMessageBox

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,channelId);
@synthesize JV2_PROP_NM(r,2,flag);

+ (void)initialize
{
    if (self == [ApolloTReqDailyPaperMessageBox class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(channelId) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqDailyPaperMessageBox";
}

@end