// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "JceObjectV2.h"

@interface ApolloTBanbanDailyPaperMessage : JceObjectV2

@property (nonatomic, assign, JV2_PROP_GS_V2(mid,setMid:)) JceInt64 JV2_PROP_NM(r,0,mid);
@property (nonatomic, assign, JV2_PROP_GS_V2(type,setType:)) JceInt32 JV2_PROP_NM(r,1,type);
@property (nonatomic, retain, JV2_PROP_GS_V2(msgid,setMsgid:)) NSString* JV2_PROP_NM(r,2,msgid);
@property (nonatomic, retain, JV2_PROP_GS_V2(channelId,setChannelId:)) NSString* JV2_PROP_NM(r,3,channelId);
@property (nonatomic, retain, JV2_PROP_GS_V2(title,setTitle:)) NSString* JV2_PROP_NM(r,4,title);
@property (nonatomic, retain, JV2_PROP_GS_V2(content,setContent:)) NSString* JV2_PROP_NM(r,5,content);
@property (nonatomic, retain, JV2_PROP_GS_V2(picUrl,setPicUrl:)) NSString* JV2_PROP_NM(r,6,picUrl);
@property (nonatomic, assign, JV2_PROP_GS_V2(picHeight,setPicHeight:)) JceInt32 JV2_PROP_NM(o,7,picHeight);
@property (nonatomic, assign, JV2_PROP_GS_V2(picWidth,setPicWidth:)) JceInt32 JV2_PROP_NM(o,8,picWidth);
@property (nonatomic, assign, JV2_PROP_GS_V2(sendertime,setSendertime:)) JceInt64 JV2_PROP_NM(o,9,sendertime);
@property (nonatomic, retain, JV2_PROP_GS_V2(senderName,setSenderName:)) NSString* JV2_PROP_NM(o,10,senderName);
@property (nonatomic, retain, JV2_PROP_GS_V2(senderPicUrl,setSenderPicUrl:)) NSString* JV2_PROP_NM(o,11,senderPicUrl);
@property (nonatomic, assign, JV2_PROP_GS_V2(recvType,setRecvType:)) JceInt32 JV2_PROP_NM(o,12,recvType);
@property (nonatomic, retain, JV2_PROP_GS_V2(introduce,setIntroduce:)) NSString* JV2_PROP_NM(o,13,introduce);

@end
