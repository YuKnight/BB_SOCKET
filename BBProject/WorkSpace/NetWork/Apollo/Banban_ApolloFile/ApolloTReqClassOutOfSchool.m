// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTReqClassOutOfSchool.h"

@implementation ApolloTReqClassOutOfSchool

@synthesize JV2_PROP_NM(r,0,classcode);
@synthesize JV2_PROP_NM(r,1,cid);
@synthesize JV2_PROP_NM(r,2,sid);

+ (void)initialize
{
    if (self == [ApolloTReqClassOutOfSchool class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(classcode) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqClassOutOfSchool";
}

@end
