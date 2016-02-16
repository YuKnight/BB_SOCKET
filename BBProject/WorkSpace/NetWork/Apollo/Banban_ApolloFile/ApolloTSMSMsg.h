// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloCLIENT_TYPE.h"
#import "ApolloTReceiverObject.h"

@interface ApolloTSMSMsg : JceObjectV2

@property (nonatomic, assign, JV2_PROP_GS_V2(smsid,setSmsid:)) JceInt64 JV2_PROP_NM(r,0,smsid);
@property (nonatomic, retain, JV2_PROP_GS_V2(sSenderId,setSSenderId:)) NSString* JV2_PROP_NM(r,1,sSenderId);
@property (nonatomic, retain, JV2_PROP_GS_V2(sSenderPhoto,setSSenderPhoto:)) NSString* JV2_PROP_NM(r,2,sSenderPhoto);
@property (nonatomic, retain, JV2_PROP_GS_V2(sSenderTitle,setSSenderTitle:)) NSString* JV2_PROP_NM(r,3,sSenderTitle);
@property (nonatomic, retain, JV2_PROP_GS_V2(vReceiver,setVReceiver:)) NSArray* JV2_PROP_EX(r,4,vReceiver,VOApolloTReceiverObject);
@property (nonatomic, retain, JV2_PROP_GS_V2(receiverTitle,setReceiverTitle:)) NSString* JV2_PROP_NM(r,5,receiverTitle);
@property (nonatomic, assign, JV2_PROP_GS_V2(iType,setIType:)) JceInt32 JV2_PROP_NM(r,6,iType);
@property (nonatomic, retain, JV2_PROP_GS_V2(content,setContent:)) NSString* JV2_PROP_NM(r,7,content);
@property (nonatomic, assign, JV2_PROP_GS_V2(lSendTime,setLSendTime:)) JceInt64 JV2_PROP_NM(r,8,lSendTime);
@property (nonatomic, assign, JV2_PROP_GS_V2(nPlatform,setNPlatform:)) ApolloCLIENT_TYPE JV2_PROP_NM(r,9,nPlatform);
@property (nonatomic, assign, JV2_PROP_GS_V2(index,setIndex:)) JceInt64 JV2_PROP_NM(o,10,index);

@end
