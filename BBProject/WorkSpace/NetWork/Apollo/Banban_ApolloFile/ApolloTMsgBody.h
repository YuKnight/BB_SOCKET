// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClientProto.jce'
// **********************************************************************

#import "JceObjectV2.h"

@interface ApolloTMsgBody : JceObjectV2

@property (nonatomic, assign, JV2_PROP_GS_V2(nCMDID,setNCMDID:)) JceInt16 JV2_PROP_NM(r,0,nCMDID);
@property (nonatomic, assign, JV2_PROP_GS_V2(nMsgType,setNMsgType:)) JceInt16 JV2_PROP_NM(r,1,nMsgType);
@property (nonatomic, retain, JV2_PROP_GS_V2(vMsgData,setVMsgData:)) NSData* JV2_PROP_NM(o,2,vMsgData);
@property (nonatomic, assign, JV2_PROP_GS_V2(iRet,setIRet:)) JceInt32 JV2_PROP_NM(o,3,iRet);
@property (nonatomic, retain, JV2_PROP_GS_V2(sMsg,setSMsg:)) NSString* JV2_PROP_NM(o,4,sMsg);

@end
