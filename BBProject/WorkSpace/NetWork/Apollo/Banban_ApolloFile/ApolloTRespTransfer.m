// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFee.jce'
// **********************************************************************

#import "ApolloTRespTransfer.h"

@implementation ApolloTRespTransfer

@synthesize JV2_PROP_NM(r,0,iRet);
@synthesize JV2_PROP_NM(r,1,strMsg);
@synthesize JV2_PROP_NM(o,2,lOrderNum);
@synthesize JV2_PROP_NM(o,3,monthTransferBanlance);

+ (void)initialize
{
    if (self == [ApolloTRespTransfer class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(strMsg) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespTransfer";
}

@end
