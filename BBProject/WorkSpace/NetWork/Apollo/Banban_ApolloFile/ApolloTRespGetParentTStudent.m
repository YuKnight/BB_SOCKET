// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/HttpClass.jce'
// **********************************************************************

#import "ApolloTRespGetParentTStudent.h"

@implementation ApolloTRespGetParentTStudent

@synthesize JV2_PROP_EX(r,0,vMyStudents,VOApolloTStudent);
@synthesize JV2_PROP_EX(r,1,vFocusStudents,VOApolloTStudent);

+ (void)initialize
{
    if (self == [ApolloTRespGetParentTStudent class]) {
        [ApolloTStudent initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vMyStudents) = DefaultJceArray;
        JV2_PROP(vFocusStudents) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespGetParentTStudent";
}

@end
