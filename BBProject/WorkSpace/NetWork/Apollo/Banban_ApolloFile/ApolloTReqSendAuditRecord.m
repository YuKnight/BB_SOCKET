// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/audit.jce'
// **********************************************************************

#import "ApolloTReqSendAuditRecord.h"

@implementation ApolloTReqSendAuditRecord

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(o,1,childName);
@synthesize JV2_PROP_NM(r,2,cid);
@synthesize JV2_PROP_NM(r,3,type);
@synthesize JV2_PROP_NM(o,4,subject);
@synthesize JV2_PROP_NM(o,5,relation);
@synthesize JV2_PROP_NM(o,6,clientType);
@synthesize JV2_PROP_NM(o,7,studentId);

+ (void)initialize
{
    if (self == [ApolloTReqSendAuditRecord class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(childName) = DefaultJceString;
        JV2_PROP(subject) = DefaultJceString;
        JV2_PROP(relation) = DefaultJceString;
        JV2_PROP(studentId) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqSendAuditRecord";
}

@end
