// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/login.jce'
// **********************************************************************

#import "ApolloTRespLoginReSetPwd.h"

@implementation ApolloTRespLoginReSetPwd

@synthesize JV2_PROP_NM(r,0,mobile);

+ (void)initialize
{
    if (self == [ApolloTRespLoginReSetPwd class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(mobile) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespLoginReSetPwd";
}

@end
