// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/HttpProto.jce'
// **********************************************************************

#import "ApolloTCommonRequestAuth.h"

@implementation ApolloTCommonRequestAuth

@synthesize JV2_PROP_NM(r,0,mobile);
@synthesize JV2_PROP_NM(r,1,type);
@synthesize JV2_PROP_NM(o,2,flag);

+ (void)initialize
{
    if (self == [ApolloTCommonRequestAuth class]) {
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
    return @"Apollo.TCommonRequestAuth";
}

@end