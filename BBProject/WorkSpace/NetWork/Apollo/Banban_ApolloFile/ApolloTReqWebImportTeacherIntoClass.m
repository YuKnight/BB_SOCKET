// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Adapte.jce'
// **********************************************************************

#import "ApolloTReqWebImportTeacherIntoClass.h"

@implementation ApolloTReqWebImportTeacherIntoClass

@synthesize JV2_PROP_NM(r,0,cid);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_NM(r,2,mobile);
@synthesize JV2_PROP_NM(r,3,subject);

+ (void)initialize
{
    if (self == [ApolloTReqWebImportTeacherIntoClass class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(mobile) = DefaultJceString;
        JV2_PROP(subject) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqWebImportTeacherIntoClass";
}

@end
