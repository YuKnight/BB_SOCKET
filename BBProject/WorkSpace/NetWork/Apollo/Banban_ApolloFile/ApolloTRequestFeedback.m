// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Upgrade.jce'
// **********************************************************************

#import "ApolloTRequestFeedback.h"

@implementation ApolloTRequestFeedback

@synthesize JV2_PROP_NM(r,0,sContent);

+ (void)initialize
{
    if (self == [ApolloTRequestFeedback class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(sContent) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRequestFeedback";
}

@end
