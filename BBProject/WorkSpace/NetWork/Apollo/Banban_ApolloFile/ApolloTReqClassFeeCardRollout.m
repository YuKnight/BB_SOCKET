// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFeeCard.jce'
// **********************************************************************

#import "ApolloTReqClassFeeCardRollout.h"

@implementation ApolloTReqClassFeeCardRollout

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,strName);
@synthesize JV2_PROP_NM(o,2,iType);

+ (void)initialize
{
    if (self == [ApolloTReqClassFeeCardRollout class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(strName) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqClassFeeCardRollout";
}

@end