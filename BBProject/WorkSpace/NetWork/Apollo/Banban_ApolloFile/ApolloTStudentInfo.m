// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/notice.jce'
// **********************************************************************

#import "ApolloTStudentInfo.h"

@implementation ApolloTStudentInfo

@synthesize JV2_PROP_NM(r,0,sid);
@synthesize JV2_PROP_EX(o,1,vFamilys,VOApolloTFamily);
@synthesize JV2_PROP_NM(r,2,name);
@synthesize JV2_PROP_NM(r,3,photo);
@synthesize JV2_PROP_NM(o,4,studentNumber);
@synthesize JV2_PROP_NM(o,5,joinTime);
@synthesize JV2_PROP_NM(o,6,icon);
@synthesize JV2_PROP_NM(o,7,readTime);

+ (void)initialize
{
    if (self == [ApolloTStudentInfo class]) {
        [ApolloTFamily initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(sid) = DefaultJceString;
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(photo) = DefaultJceString;
        JV2_PROP(studentNumber) = DefaultJceString;
        JV2_PROP(joinTime) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TStudentInfo";
}

@end
