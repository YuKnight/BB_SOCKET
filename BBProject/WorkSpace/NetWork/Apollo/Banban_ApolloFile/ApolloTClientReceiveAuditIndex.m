// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/audit.jce'
// **********************************************************************

#import "ApolloTClientReceiveAuditIndex.h"

@implementation ApolloTClientReceiveAuditIndex

@synthesize JV2_PROP_NM(r,0,cid);
@synthesize JV2_PROP_NM(r,1,index);
@synthesize JV2_PROP_NM(r,2,uid);

+ (void)initialize
{
    if (self == [ApolloTClientReceiveAuditIndex class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(cid) = DefaultJceString;
        JV2_PROP(uid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TClientReceiveAuditIndex";
}

@end
