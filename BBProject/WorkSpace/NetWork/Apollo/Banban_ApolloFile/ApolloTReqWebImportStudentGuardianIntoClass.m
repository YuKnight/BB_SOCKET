// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Adapte.jce'
// **********************************************************************

#import "ApolloTReqWebImportStudentGuardianIntoClass.h"

@implementation ApolloTReqWebImportStudentGuardianIntoClass

@synthesize JV2_PROP_NM(r,0,cid);
@synthesize JV2_PROP_EX(o,1,vStudentItem,VOApolloTWebImportStudentGuardianItem);

+ (void)initialize
{
    if (self == [ApolloTReqWebImportStudentGuardianIntoClass class]) {
        [ApolloTWebImportStudentGuardianItem initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqWebImportStudentGuardianIntoClass";
}

@end
