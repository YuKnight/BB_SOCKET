// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/chat.jce'
// **********************************************************************

#import "ApolloTChatMessageBox.h"

@implementation ApolloTChatMessageBox

@synthesize JV2_PROP_NM(r,0,count);
@synthesize JV2_PROP_EX(r,1,vMessages,VOApolloTChatMessage);
@synthesize JV2_PROP_NM(r,2,targeterid);

+ (void)initialize
{
    if (self == [ApolloTChatMessageBox class]) {
        [ApolloTChatMessage initialize];
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(vMessages) = DefaultJceArray;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TChatMessageBox";
}

@end