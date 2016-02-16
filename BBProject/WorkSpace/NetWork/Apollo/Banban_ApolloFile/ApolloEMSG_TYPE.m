// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Package.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloEMSG_TYPE.h"

#if JCEV2_ENUM_ETOS_AND_STOE_SUPPORTED

@implementation ApolloEMSG_TYPEHelper

+ (NSString *)etos:(ApolloEMSG_TYPE)e
{
    switch(e){
        case ApolloEMSG_TYPE_MSGTYPE_NULL: return @"ApolloEMSG_TYPE_MSGTYPE_NULL";
        case ApolloEMSG_TYPE_MSGTYPE_REQUEST: return @"ApolloEMSG_TYPE_MSGTYPE_REQUEST";
        case ApolloEMSG_TYPE_MSGTYPE_RESPONSE: return @"ApolloEMSG_TYPE_MSGTYPE_RESPONSE";
        case ApolloEMSG_TYPE_MSGTYPE_NOTIFY: return @"ApolloEMSG_TYPE_MSGTYPE_NOTIFY";
        case ApolloEMSG_TYPE_MSGTYPE_NOTIFY_ACK: return @"ApolloEMSG_TYPE_MSGTYPE_NOTIFY_ACK";
        case ApolloEMSG_TYPE_MSGTYPE_SERVER_REQ: return @"ApolloEMSG_TYPE_MSGTYPE_SERVER_REQ";
        case ApolloEMSG_TYPE_MSGTYPE_SERVER_RESP: return @"ApolloEMSG_TYPE_MSGTYPE_SERVER_RESP";
        default: return @"";
    }
}

+ (ApolloEMSG_TYPE)stoe:(NSString *)s
{
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_NULL")) return ApolloEMSG_TYPE_MSGTYPE_NULL;
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_REQUEST")) return ApolloEMSG_TYPE_MSGTYPE_REQUEST;
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_RESPONSE")) return ApolloEMSG_TYPE_MSGTYPE_RESPONSE;
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_NOTIFY")) return ApolloEMSG_TYPE_MSGTYPE_NOTIFY;
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_NOTIFY_ACK")) return ApolloEMSG_TYPE_MSGTYPE_NOTIFY_ACK;
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_SERVER_REQ")) return ApolloEMSG_TYPE_MSGTYPE_SERVER_REQ;
    if(isJceEnumStringEqual(s, @"ApolloEMSG_TYPE_MSGTYPE_SERVER_RESP")) return ApolloEMSG_TYPE_MSGTYPE_SERVER_RESP;
    return NSIntegerMin;
}

@end

#endif
