// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTReqOmsAddSingleTeacher.h"

@implementation ApolloTReqOmsAddSingleTeacher

@synthesize JV2_PROP_NM(r,0,mobilePhone);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_EX(r,2,vItem,VOApolloTAddSingleTeacherClassItem);

+ (void)initialize
{
    if (self == [ApolloTReqOmsAddSingleTeacher class]) {
        [ApolloTAddSingleTeacherClassItem initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(mobilePhone) = DefaultJceString;
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(vItem) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqOmsAddSingleTeacher";
}

@end