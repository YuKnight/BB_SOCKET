// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "ApolloTRecUserInfo.h"

@implementation ApolloTRecUserInfo

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_NM(r,2,identity);
@synthesize JV2_PROP_EX(r,3,vecFamily,VOApolloTRecFamily);
@synthesize JV2_PROP_NM(r,4,mobilePhone);

+ (void)initialize
{
    if (self == [ApolloTRecUserInfo class]) {
        [ApolloTRecFamily initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(vecFamily) = DefaultJceArray;
        JV2_PROP(mobilePhone) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRecUserInfo";
}

@end
