// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/HttpClass.jce'
// **********************************************************************

#import "ApolloTReqEditLabel.h"

@implementation ApolloTReqEditLabel

@synthesize JV2_PROP_NM(r,0,id);
@synthesize JV2_PROP_NM(r,1,flag);
@synthesize JV2_PROP_NM(r,2,userlabel);

+ (void)initialize
{
    if (self == [ApolloTReqEditLabel class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(userlabel) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TReqEditLabel";
}

@end
