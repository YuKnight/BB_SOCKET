// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "ApolloTUserChild.h"

@implementation ApolloTUserChild

@synthesize JV2_PROP_NM(r,0,studentid);
@synthesize JV2_PROP_NM(r,1,role);
@synthesize JV2_PROP_NM(r,2,main);
@synthesize JV2_PROP_NM(r,3,name);
@synthesize JV2_PROP_NM(r,4,username);

+ (void)initialize
{
    if (self == [ApolloTUserChild class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(studentid) = DefaultJceString;
        JV2_PROP(role) = DefaultJceString;
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(username) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TUserChild";
}

@end
