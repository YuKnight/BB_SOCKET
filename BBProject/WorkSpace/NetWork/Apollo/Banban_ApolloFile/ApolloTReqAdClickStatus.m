// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFee.jce'
// **********************************************************************

#import "ApolloTReqAdClickStatus.h"

@implementation ApolloTReqAdClickStatus

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,cid);

+ (void)initialize
{
    if (self == [ApolloTReqAdClickStatus class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqAdClickStatus";
}

@end
