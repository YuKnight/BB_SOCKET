// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/audit.jce'
// **********************************************************************

#import "ApolloTReqPushAudit.h"

@implementation ApolloTReqPushAudit

@synthesize JV2_PROP_EX(r,0,vAudit,VOApolloTAuditRecord);

+ (void)initialize
{
    if (self == [ApolloTReqPushAudit class]) {
        [ApolloTAuditRecord initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vAudit) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqPushAudit";
}

@end
