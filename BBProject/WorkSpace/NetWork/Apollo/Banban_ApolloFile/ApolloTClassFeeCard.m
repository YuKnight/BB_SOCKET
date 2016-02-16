// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/ClassFeeCard.jce'
// **********************************************************************

#import "ApolloTClassFeeCard.h"

@implementation ApolloTClassFeeCard

@synthesize JV2_PROP_NM(r,0,cardid);
@synthesize JV2_PROP_NM(r,1,name);
@synthesize JV2_PROP_NM(r,2,category);
@synthesize JV2_PROP_NM(r,3,money);
@synthesize JV2_PROP_NM(r,4,createtime);
@synthesize JV2_PROP_NM(r,5,endtime);
@synthesize JV2_PROP_NM(r,6,status);
@synthesize JV2_PROP_NM(o,7,ruleid);
@synthesize JV2_PROP_NM(o,8,index);

+ (void)initialize
{
    if (self == [ApolloTClassFeeCard class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(name) = DefaultJceString;
        JV2_PROP(ruleid) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TClassFeeCard";
}

@end