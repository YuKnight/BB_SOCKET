// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTReqPushDailyPaperMessageBox.h"

@implementation ApolloTReqPushDailyPaperMessageBox

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,channelId);
@synthesize JV2_PROP_NM(r,2,messageBox);
@synthesize JV2_PROP_NM(r,3,pushLocation);

+ (void)initialize
{
    if (self == [ApolloTReqPushDailyPaperMessageBox class]) {
        [ApolloTBanbanDailyPaperMessageBox initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(channelId) = DefaultJceString;
        JV2_PROP(messageBox) = [ApolloTBanbanDailyPaperMessageBox object];
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqPushDailyPaperMessageBox";
}

@end