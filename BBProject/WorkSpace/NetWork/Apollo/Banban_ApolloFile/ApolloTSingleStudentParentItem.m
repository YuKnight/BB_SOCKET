// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "ApolloTSingleStudentParentItem.h"

@implementation ApolloTSingleStudentParentItem

@synthesize JV2_PROP_NM(r,0,mobile);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_NM(r,2,role);
@synthesize JV2_PROP_NM(r,3,main);

+ (void)initialize
{
    if (self == [ApolloTSingleStudentParentItem class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(mobile) = DefaultJceString;
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(role) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TSingleStudentParentItem";
}

@end
