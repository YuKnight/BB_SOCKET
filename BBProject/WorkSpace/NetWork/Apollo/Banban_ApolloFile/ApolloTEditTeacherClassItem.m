// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTEditTeacherClassItem.h"

@implementation ApolloTEditTeacherClassItem

@synthesize JV2_PROP_NM(r,0,cid);
@synthesize JV2_PROP_NM(r,1,subject);
@synthesize JV2_PROP_NM(r,2,type);

+ (void)initialize
{
    if (self == [ApolloTEditTeacherClassItem class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(subject) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TEditTeacherClassItem";
}

@end