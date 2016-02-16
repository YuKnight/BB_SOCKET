// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "ApolloTRespAppSendNoticeDetail.h"

@implementation ApolloTRespAppSendNoticeDetail

@synthesize JV2_PROP_EX(r,0,teacherRead,VOApolloTTeacher);
@synthesize JV2_PROP_EX(r,1,teacherUnread,VOApolloTTeacher);
@synthesize JV2_PROP_EX(r,2,studentRead,VOApolloTStudent);
@synthesize JV2_PROP_EX(r,3,studentUnread,VOApolloTStudent);
@synthesize JV2_PROP_NM(o,4,totalStudent);
@synthesize JV2_PROP_EX(o,5,readTime,VOApolloTNoticeReadTime);

+ (void)initialize
{
    if (self == [ApolloTRespAppSendNoticeDetail class]) {
        [ApolloTNoticeReadTime initialize];
        [ApolloTStudent initialize];
        [ApolloTTeacher initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(teacherRead) = DefaultJceArray;
        JV2_PROP(teacherUnread) = DefaultJceArray;
        JV2_PROP(studentRead) = DefaultJceArray;
        JV2_PROP(studentUnread) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespAppSendNoticeDetail";
}

@end
