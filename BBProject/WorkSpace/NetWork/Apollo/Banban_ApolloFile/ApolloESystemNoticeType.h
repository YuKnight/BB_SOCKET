// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "JceObjectV2.h"

enum {
    ApolloESystemNoticeType_EALL = 0,
    ApolloESystemNoticeType_ESTUDENT_APPLY = 1,
    ApolloESystemNoticeType_ETEACHER_APPLY = 2,
    ApolloESystemNoticeType_ESTUDENT_JOIN = 3,
    ApolloESystemNoticeType_ETEACHER_JOIN = 4,
    ApolloESystemNoticeType_ESTUDENT_REJECT = 5,
    ApolloESystemNoticeType_ETEACHER_REJECT = 6,
    ApolloESystemNoticeType_ESTUDENT_OUT = 7,
    ApolloESystemNoticeType_ETEACHER_OUT = 8,
    ApolloESystemNoticeType_ESTUDENT_KICK = 9,
    ApolloESystemNoticeType_ETEACHER_KICK = 10,
    ApolloESystemNoticeType_ECLASS_DISSOLVE = 11,
    ApolloESystemNoticeType_EHEAD_TEACHER_ALTER = 12,
    ApolloESystemNoticeType_EHEAD_TEACHER_ALTER_NOTIFY = 13,
    ApolloESystemNoticeType_EHEAD_APPLY_NOTIFY = 14,
    ApolloESystemNoticeType_EHEAD_JOIN_NOTIFY = 15,
    ApolloESystemNoticeType_ETEACHER_JOIN_AUDIT = 16,
    ApolloESystemNoticeType_ESTUDENT_JOIN_AUDIT = 17,
    ApolloESystemNoticeType_EV3_7USER_JOIN_V3_8CLASS = 18,
    ApolloESystemNoticeType_ETEACHER_JOIN_SELF = 19,
    ApolloESystemNoticeType_EFOCUS_IN_CHILD = 20,
    ApolloESystemNoticeType_EDEL_FOCUS_CHILD = 21,
    ApolloESystemNoticeType_EDEL_CHILD_NOTIFY_GUARDIAN = 22,
    ApolloESystemNoticeType_EDEL_CHILD_NOTIFY_MASTER = 23,
    ApolloESystemNoticeType_ESTUDENT_OUT_NOTIFY_MASTER = 24,
    ApolloESystemNoticeType_EINVITE_GET_NOTIFY_CLASSFEE = 25,
    ApolloESystemNoticeType_EDEL_CHILD_FOCUS_USER = 26,
    ApolloESystemNoticeType_EADD_CHILD_FOCUS_USER = 27,
    ApolloESystemNoticeType_EPULL_NEW_ACTIVITY_REWARD = 28,
    ApolloESystemNoticeType_EPULL_NEW_ACTIVITY_PRIVILEGED = 29
};
#define ApolloESystemNoticeType NSInteger

#if JCEV2_ENUM_ETOS_AND_STOE_SUPPORTED

@interface ApolloESystemNoticeTypeHelper: JceEnumHelper

+ (NSString *)etos:(ApolloESystemNoticeType)e;
+ (ApolloESystemNoticeType)stoe:(NSString *)s;

@end

#endif