// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTSubjectScore.h"

@interface ApolloTScoreContent : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(tagid,setTagid:)) NSString* JV2_PROP_NM(r,0,tagid);
@property (nonatomic, retain, JV2_PROP_GS_V2(title,setTitle:)) NSString* JV2_PROP_NM(r,1,title);
@property (nonatomic, retain, JV2_PROP_GS_V2(examine,setExamine:)) NSString* JV2_PROP_NM(r,2,examine);
@property (nonatomic, assign, JV2_PROP_GS_V2(timestamp,setTimestamp:)) JceInt64 JV2_PROP_NM(r,3,timestamp);
@property (nonatomic, retain, JV2_PROP_GS_V2(vSubjectScore,setVSubjectScore:)) NSArray* JV2_PROP_EX(r,4,vSubjectScore,VOApolloTSubjectScore);
@property (nonatomic, assign, JV2_PROP_GS_V2(cid,setCid:)) JceInt64 JV2_PROP_NM(o,5,cid);

@end
