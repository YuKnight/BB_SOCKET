// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/class.jce'
// **********************************************************************

#import "ApolloTRecEmClassTeacher.h"

@implementation ApolloTRecEmClassTeacher

@synthesize JV2_PROP_NM(r,0,cid);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_EX(r,2,vTeachers,VOApolloTTeacher);

+ (void)initialize
{
    if (self == [ApolloTRecEmClassTeacher class]) {
        [ApolloTTeacher initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(vTeachers) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRecEmClassTeacher";
}

@end
