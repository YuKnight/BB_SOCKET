// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/HttpClass.jce'
// **********************************************************************

#import "ApolloTRespCreateChild.h"

@implementation ApolloTRespCreateChild

@synthesize JV2_PROP_NM(r,0,studentUid);

+ (void)initialize
{
    if (self == [ApolloTRespCreateChild class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(studentUid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespCreateChild";
}

@end
