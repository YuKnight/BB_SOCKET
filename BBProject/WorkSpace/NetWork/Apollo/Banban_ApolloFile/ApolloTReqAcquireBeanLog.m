// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Bean.jce'
// **********************************************************************

#import "ApolloTReqAcquireBeanLog.h"

@implementation ApolloTReqAcquireBeanLog

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,index);
@synthesize JV2_PROP_NM(r,2,flag);

+ (void)initialize
{
    if (self == [ApolloTReqAcquireBeanLog class]) {
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
    return @"Apollo.TReqAcquireBeanLog";
}

@end
