// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "ApolloTRecEmergencySchoolClassTeacherGroup.h"

@implementation ApolloTRecEmergencySchoolClassTeacherGroup

@synthesize JV2_PROP_NM(r,0,sid);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_EX(r,2,vEmClassTeacher,VOApolloTRecEmClassTeacher);

+ (void)initialize
{
    if (self == [ApolloTRecEmergencySchoolClassTeacherGroup class]) {
        [ApolloTRecEmClassTeacher initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(vEmClassTeacher) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRecEmergencySchoolClassTeacherGroup";
}

@end
