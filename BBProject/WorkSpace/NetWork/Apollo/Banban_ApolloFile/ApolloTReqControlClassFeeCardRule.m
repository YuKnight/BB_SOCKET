// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFeeCard.jce'
// **********************************************************************

#import "ApolloTReqControlClassFeeCardRule.h"

@implementation ApolloTReqControlClassFeeCardRule

@synthesize JV2_PROP_NM(r,0,ruleid);
@synthesize JV2_PROP_NM(r,1,flag);

+ (void)initialize
{
    if (self == [ApolloTReqControlClassFeeCardRule class]) {
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
    return @"Apollo.TReqControlClassFeeCardRule";
}

@end