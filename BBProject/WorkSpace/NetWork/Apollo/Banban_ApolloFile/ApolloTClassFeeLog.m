// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFee.jce'
// **********************************************************************

#import "ApolloTClassFeeLog.h"

@implementation ApolloTClassFeeLog

@synthesize JV2_PROP_NM(r,0,uid);
@synthesize JV2_PROP_NM(r,1,strName);
@synthesize JV2_PROP_NM(r,2,sEventID);
@synthesize JV2_PROP_NM(r,3,dValue);
@synthesize JV2_PROP_NM(r,4,timestamp);
@synthesize JV2_PROP_NM(o,5,strRemark);
@synthesize JV2_PROP_NM(o,6,lOrderNum);
@synthesize JV2_PROP_NM(o,7,sEventName);
@synthesize JV2_PROP_NM(o,8,pm);

+ (void)initialize
{
    if (self == [ApolloTClassFeeLog class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(uid) = DefaultJceString;
        JV2_PROP(strName) = DefaultJceString;
        JV2_PROP(strRemark) = DefaultJceString;
        JV2_PROP(sEventName) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TClassFeeLog";
}

@end
