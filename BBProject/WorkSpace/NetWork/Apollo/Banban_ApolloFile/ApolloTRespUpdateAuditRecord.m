// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/audit.jce'
// **********************************************************************

#import "ApolloTRespUpdateAuditRecord.h"

@implementation ApolloTRespUpdateAuditRecord

@synthesize JV2_PROP_NM(r,0,result);

+ (void)initialize
{
    if (self == [ApolloTRespUpdateAuditRecord class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespUpdateAuditRecord";
}

@end
