// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFeeCard.jce'
// **********************************************************************

#import "ApolloTRespPublishClassFeeCardRule.h"

@implementation ApolloTRespPublishClassFeeCardRule

@synthesize JV2_PROP_NM(r,0,ruleid);

+ (void)initialize
{
    if (self == [ApolloTRespPublishClassFeeCardRule class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(ruleid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespPublishClassFeeCardRule";
}

@end