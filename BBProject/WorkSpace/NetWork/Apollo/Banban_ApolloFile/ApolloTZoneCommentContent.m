// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTZoneCommentContent.h"

@implementation ApolloTZoneCommentContent

@synthesize JV2_PROP_NM(r,0,msgId);
@synthesize JV2_PROP_NM(r,1,sender);
@synthesize JV2_PROP_NM(r,2,targeter);
@synthesize JV2_PROP_EX(r,3,content,VOApolloTZonePictureText);
@synthesize JV2_PROP_NM(r,4,likeCount);
@synthesize JV2_PROP_NM(o,5,sharecount);
@synthesize JV2_PROP_NM(o,6,simpleDesp);

+ (void)initialize
{
    if (self == [ApolloTZoneCommentContent class]) {
        [ApolloTZonePictureText initialize];
        [ApolloTZoneSenderObject initialize];
        [ApolloTZoneTargeterObjcet initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(msgId) = DefaultJceString;
        JV2_PROP(sender) = [ApolloTZoneSenderObject object];
        JV2_PROP(targeter) = [ApolloTZoneTargeterObjcet object];
        JV2_PROP(content) = DefaultJceArray;
        JV2_PROP(simpleDesp) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TZoneCommentContent";
}

@end
