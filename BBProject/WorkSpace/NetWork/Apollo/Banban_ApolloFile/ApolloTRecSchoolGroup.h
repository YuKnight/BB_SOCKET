// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloTClass.h"

@interface ApolloTRecSchoolGroup : JceObjectV2

@property (nonatomic, assign, JV2_PROP_GS_V2(sid,setSid:)) JceInt32 JV2_PROP_NM(r,0,sid);
@property (nonatomic, retain, JV2_PROP_GS_V2(name,setName:)) NSString* JV2_PROP_NM(r,1,name);
@property (nonatomic, retain, JV2_PROP_GS_V2(vClass,setVClass:)) NSArray* JV2_PROP_EX(r,2,vClass,VOApolloTClass);

@end