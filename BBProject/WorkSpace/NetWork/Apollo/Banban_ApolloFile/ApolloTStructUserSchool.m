// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "ApolloTStructUserSchool.h"

@implementation ApolloTStructUserSchool

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,sid);
@synthesize JV2_PROP_NM(r,2,schoolName);

+ (void)initialize
{
    if (self == [ApolloTStructUserSchool class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(schoolName) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TStructUserSchool";
}

@end
