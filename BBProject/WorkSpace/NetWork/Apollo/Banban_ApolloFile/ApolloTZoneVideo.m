// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/zone.jce'
// **********************************************************************

#import "ApolloTZoneVideo.h"

@implementation ApolloTZoneVideo

@synthesize JV2_PROP_NM(r,0,height);
@synthesize JV2_PROP_NM(r,1,width);
@synthesize JV2_PROP_NM(r,2,pictureUrl);
@synthesize JV2_PROP_NM(r,3,videoUrl);

+ (void)initialize
{
    if (self == [ApolloTZoneVideo class]) {
        [super initialize];
    }
}

- (id)init
{
    if (self = [super init]) {
        JV2_PROP(pictureUrl) = DefaultJceString;
        JV2_PROP(videoUrl) = DefaultJceString;
    }
    return self;
}

+ (NSString*)jceType
{
    return @"Apollo.TZoneVideo";
}

@end