// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTZoneCommentContent.h"

@interface ApolloTReqSendComment : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(content,setContent:)) ApolloTZoneCommentContent* JV2_PROP_NM(r,0,content);
@property (nonatomic, assign, JV2_PROP_GS_V2(location,setLocation:)) JceInt32 JV2_PROP_NM(r,1,location);
@property (nonatomic, assign, JV2_PROP_GS_V2(commentId,setCommentId:)) JceInt64 JV2_PROP_NM(o,2,commentId);

@end