// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/chat.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTChatMessage.h"

@interface ApolloTChatMessageBox : JceObjectV2

@property (nonatomic, assign, JV2_PROP_GS_V2(count,setCount:)) JceInt32 JV2_PROP_NM(r,0,count);
@property (nonatomic, retain, JV2_PROP_GS_V2(vMessages,setVMessages:)) NSArray* JV2_PROP_EX(r,1,vMessages,VOApolloTChatMessage);
@property (nonatomic, assign, JV2_PROP_GS_V2(targeterid,setTargeterid:)) JceInt32 JV2_PROP_NM(r,2,targeterid);

@end