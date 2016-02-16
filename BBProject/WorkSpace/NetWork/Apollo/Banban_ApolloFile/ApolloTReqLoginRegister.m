// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/login.jce'
// **********************************************************************

#import "ApolloTReqLoginRegister.h"

@implementation ApolloTReqLoginRegister

@synthesize JV2_PROP_NM(r,0,mobile);
@synthesize JV2_PROP_NM(r,1,verifycode);
@synthesize JV2_PROP_NM(r,2,pwd);
@synthesize JV2_PROP_NM(r,3,username);
@synthesize JV2_PROP_NM(r,4,sDeviceID);
@synthesize JV2_PROP_NM(o,5,apnsToken);
@synthesize JV2_PROP_NM(o,6,invitemobile);
@synthesize JV2_PROP_NM(o,7,phonetype);

+ (void)initialize
{
    if (self == [ApolloTReqLoginRegister class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(mobile) = DefaultJceString;
        JV2_PROP(verifycode) = DefaultJceString;
        JV2_PROP(pwd) = DefaultJceString;
        JV2_PROP(username) = DefaultJceString;
        JV2_PROP(sDeviceID) = DefaultJceString;
        JV2_PROP(apnsToken) = DefaultJceString;
        JV2_PROP(invitemobile) = DefaultJceString;
        JV2_PROP(phonetype) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqLoginRegister";
}

@end
