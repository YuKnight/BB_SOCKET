// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTNotice.h"

@interface ApolloTReqSendSystemTeamMessageToSpecialUser : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(Message,setMessage:)) ApolloTNotice* JV2_PROP_NM(o,0,Message);
@property (nonatomic, assign, JV2_PROP_GS_V2(type,setType:)) JceInt32 JV2_PROP_NM(o,1,type);
@property (nonatomic, retain, JV2_PROP_GS_V2(vPhoneNumOrUserIdsStr,setVPhoneNumOrUserIdsStr:)) NSArray* JV2_PROP_EX(o,2,vPhoneNumOrUserIdsStr,VONSString);

@end
