// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/login.jce'
// **********************************************************************

#import "ApolloTReqLoginReSetPwd.h"

@implementation ApolloTReqLoginReSetPwd

@synthesize JV2_PROP_NM(r,0,mobile);
@synthesize JV2_PROP_NM(r,1,pwd);
@synthesize JV2_PROP_NM(r,2,verifycode);

+ (void)initialize
{
    if (self == [ApolloTReqLoginReSetPwd class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(mobile) = DefaultJceString;
        JV2_PROP(pwd) = DefaultJceString;
        JV2_PROP(verifycode) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqLoginReSetPwd";
}

@end
