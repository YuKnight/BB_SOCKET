// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/OMSProxy.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTNotice.h"

@interface ApolloTReqSendSystemTeamMessage : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(Message,setMessage:)) ApolloTNotice* JV2_PROP_NM(o,0,Message);
@property (nonatomic, assign, JV2_PROP_GS_V2(type,setType:)) JceInt32 JV2_PROP_NM(o,1,type);
@property (nonatomic, assign, JV2_PROP_GS_V2(userType,setUserType:)) JceInt32 JV2_PROP_NM(o,2,userType);
@property (nonatomic, assign, JV2_PROP_GS_V2(region,setRegion:)) JceInt32 JV2_PROP_NM(o,3,region);

@end