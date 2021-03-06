// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/audit.jce'
// **********************************************************************

#import "JceObjectV2.h"

@interface ApolloTAuditRecord : JceObjectV2

@property (nonatomic, retain, JV2_PROP_GS_V2(id,setId:)) NSString* JV2_PROP_NM(r,0,id);
@property (nonatomic, retain, JV2_PROP_GS_V2(uid,setUid:)) NSString* JV2_PROP_NM(r,1,uid);
@property (nonatomic, retain, JV2_PROP_GS_V2(childName,setChildName:)) NSString* JV2_PROP_NM(o,2,childName);
@property (nonatomic, retain, JV2_PROP_GS_V2(userName,setUserName:)) NSString* JV2_PROP_NM(r,3,userName);
@property (nonatomic, retain, JV2_PROP_GS_V2(phone,setPhone:)) NSString* JV2_PROP_NM(r,4,phone);
@property (nonatomic, retain, JV2_PROP_GS_V2(photo,setPhoto:)) NSString* JV2_PROP_NM(r,5,photo);
@property (nonatomic, retain, JV2_PROP_GS_V2(content,setContent:)) NSString* JV2_PROP_NM(r,6,content);
@property (nonatomic, assign, JV2_PROP_GS_V2(cid,setCid:)) JceInt32 JV2_PROP_NM(r,7,cid);
@property (nonatomic, retain, JV2_PROP_GS_V2(cidName,setCidName:)) NSString* JV2_PROP_NM(r,8,cidName);
@property (nonatomic, assign, JV2_PROP_GS_V2(createTime,setCreateTime:)) JceInt64 JV2_PROP_NM(r,9,createTime);
@property (nonatomic, assign, JV2_PROP_GS_V2(status,setStatus:)) JceInt32 JV2_PROP_NM(r,10,status);
@property (nonatomic, assign, JV2_PROP_GS_V2(index,setIndex:)) JceInt64 JV2_PROP_NM(r,11,index);
@property (nonatomic, retain, JV2_PROP_GS_V2(subject,setSubject:)) NSString* JV2_PROP_NM(r,12,subject);
@property (nonatomic, retain, JV2_PROP_GS_V2(auditor,setAuditor:)) NSString* JV2_PROP_NM(o,13,auditor);
@property (nonatomic, retain, JV2_PROP_GS_V2(auditTime,setAuditTime:)) NSString* JV2_PROP_NM(o,14,auditTime);
@property (nonatomic, retain, JV2_PROP_GS_V2(relation,setRelation:)) NSString* JV2_PROP_NM(o,15,relation);
@property (nonatomic, assign, JV2_PROP_GS_V2(type,setType:)) JceInt32 JV2_PROP_NM(o,16,type);
@property (nonatomic, assign, JV2_PROP_GS_V2(clientType,setClientType:)) JceInt32 JV2_PROP_NM(o,17,clientType);
@property (nonatomic, retain, JV2_PROP_GS_V2(studentId,setStudentId:)) NSString* JV2_PROP_NM(o,18,studentId);

@end
