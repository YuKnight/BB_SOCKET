// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "ApolloTGrade.h"

@implementation ApolloTGrade

@synthesize JV2_PROP_NM(r,0,gid);
@synthesize JV2_PROP_NM(r,1,gName);
@synthesize JV2_PROP_NM(r,2,stid);

+ (void)initialize
{
    if (self == [ApolloTGrade class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(gName) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TGrade";
}

@end
