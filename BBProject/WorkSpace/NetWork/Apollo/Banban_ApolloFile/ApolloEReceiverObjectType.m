// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloEReceiverObjectType.h"

#if JCEV2_ENUM_ETOS_AND_STOE_SUPPORTED

@implementation ApolloEReceiverObjectTypeHelper

+ (NSString *)etos:(ApolloEReceiverObjectType)e
{
    switch(e){
        case ApolloEReceiverObjectType_ENULL: return @"ApolloEReceiverObjectType_ENULL";
        case ApolloEReceiverObjectType_ECLASS: return @"ApolloEReceiverObjectType_ECLASS";
        case ApolloEReceiverObjectType_EGROUP: return @"ApolloEReceiverObjectType_EGROUP";
        case ApolloEReceiverObjectType_EGRADE: return @"ApolloEReceiverObjectType_EGRADE";
        case ApolloEReceiverObjectType_EALLTEACHER: return @"ApolloEReceiverObjectType_EALLTEACHER";
        case ApolloEReceiverObjectType_EPERSON: return @"ApolloEReceiverObjectType_EPERSON";
        default: return @"";
    }
}

+ (ApolloEReceiverObjectType)stoe:(NSString *)s
{
    if(isJceEnumStringEqual(s, @"ApolloEReceiverObjectType_ENULL")) return ApolloEReceiverObjectType_ENULL;
    if(isJceEnumStringEqual(s, @"ApolloEReceiverObjectType_ECLASS")) return ApolloEReceiverObjectType_ECLASS;
    if(isJceEnumStringEqual(s, @"ApolloEReceiverObjectType_EGROUP")) return ApolloEReceiverObjectType_EGROUP;
    if(isJceEnumStringEqual(s, @"ApolloEReceiverObjectType_EGRADE")) return ApolloEReceiverObjectType_EGRADE;
    if(isJceEnumStringEqual(s, @"ApolloEReceiverObjectType_EALLTEACHER")) return ApolloEReceiverObjectType_EALLTEACHER;
    if(isJceEnumStringEqual(s, @"ApolloEReceiverObjectType_EPERSON")) return ApolloEReceiverObjectType_EPERSON;
    return NSIntegerMin;
}

@end

#endif
