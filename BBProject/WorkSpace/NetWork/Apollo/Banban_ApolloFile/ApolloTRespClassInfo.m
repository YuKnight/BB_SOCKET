// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/HttpClass.jce'
// **********************************************************************

#import "ApolloTRespClassInfo.h"

@implementation ApolloTRespClassInfo

@synthesize JV2_PROP_NM(r,0,tClass);

+ (void)initialize
{
    if (self == [ApolloTRespClassInfo class]) {
        [ApolloTClass initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(tClass) = [ApolloTClass object];
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespClassInfo";
}

@end
