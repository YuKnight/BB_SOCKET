// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/login.jce'
// **********************************************************************

#import "ApolloTReqInstallStatistics.h"

@implementation ApolloTReqInstallStatistics

@synthesize JV2_PROP_NM(r,0,version);
@synthesize JV2_PROP_NM(r,1,device);
@synthesize JV2_PROP_NM(r,2,deviceId);

+ (void)initialize
{
    if (self == [ApolloTReqInstallStatistics class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(version) = DefaultJceString;
        JV2_PROP(device) = DefaultJceString;
        JV2_PROP(deviceId) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqInstallStatistics";
}

@end