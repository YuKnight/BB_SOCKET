// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTZoneSenderObject.h"

@implementation ApolloTZoneSenderObject

@synthesize JV2_PROP_NM(r,0,senderId);
@synthesize JV2_PROP_NM(r,1,senderName);
@synthesize JV2_PROP_NM(r,2,photo);
@synthesize JV2_PROP_NM(r,3,identity);
@synthesize JV2_PROP_NM(r,4,address);
@synthesize JV2_PROP_NM(o,5,city);

+ (void)initialize
{
    if (self == [ApolloTZoneSenderObject class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(senderId) = DefaultJceString;
        JV2_PROP(senderName) = DefaultJceString;
        JV2_PROP(photo) = DefaultJceString;
        JV2_PROP(address) = DefaultJceString;
        JV2_PROP(city) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TZoneSenderObject";
}

@end
