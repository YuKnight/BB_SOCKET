// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Package.jce'
// **********************************************************************

#import "JceObjectV2.h"

enum {
    ApolloAUTH_TYPE_AUTH_REGISTER = 1,
    ApolloAUTH_TYPE_AUTH_GETPWD = 2,
    ApolloAUTH_TYPE_AUTH_EDITMOBILE = 3,
    ApolloAUTH_TYPE_AUTH_CHANGECLASSFEE = 4,
    ApolloAUTH_TYPE_AUTH_CHANGECLASSFEECARD = 5
};
#define ApolloAUTH_TYPE NSInteger

#if JCEV2_ENUM_ETOS_AND_STOE_SUPPORTED

@interface ApolloAUTH_TYPEHelper: JceEnumHelper

+ (NSString *)etos:(ApolloAUTH_TYPE)e;
+ (ApolloAUTH_TYPE)stoe:(NSString *)s;

@end

#endif