// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Bean.jce'
// **********************************************************************

#import "ApolloTBeanOperationRecord.h"

@implementation ApolloTBeanOperationRecord

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,iRuleId);
@synthesize JV2_PROP_NM(r,2,clientType);
@synthesize JV2_PROP_NM(r,3,alterBean);
@synthesize JV2_PROP_NM(o,4,index);

+ (void)initialize
{
    if (self == [ApolloTBeanOperationRecord class]) {
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
    return @"Apollo.TBeanOperationRecord";
}

@end
