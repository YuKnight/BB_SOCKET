// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/chat.jce'
// **********************************************************************

#import "ApolloTRespGetChatMessage.h"

@implementation ApolloTRespGetChatMessage

@synthesize JV2_PROP_EX(r,0,vChatMessages,VOApolloTChatMessage);
@synthesize JV2_PROP_NM(r,1,unarrive);

+ (void)initialize
{
    if (self == [ApolloTRespGetChatMessage class]) {
        [ApolloTChatMessage initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vChatMessages) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TRespGetChatMessage";
}

@end
