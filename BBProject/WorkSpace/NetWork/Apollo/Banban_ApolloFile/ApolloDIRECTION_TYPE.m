// **********************************************************************
// This file was generated by a TAF parser!
// TAF version 3.0.0.32 by WSRD Tencent.
// Generated from `./jce/Package.jce'
// **********************************************************************

#import "JceObjectV2.h"
#import "ApolloDIRECTION_TYPE.h"

#if JCEV2_ENUM_ETOS_AND_STOE_SUPPORTED

@implementation ApolloDIRECTION_TYPEHelper

+ (NSString *)etos:(ApolloDIRECTION_TYPE)e
{
    switch(e){
        case ApolloDIRECTION_TYPE_DIRECTION_UP: return @"ApolloDIRECTION_TYPE_DIRECTION_UP";
        case ApolloDIRECTION_TYPE_DIRECTION_DOWN: return @"ApolloDIRECTION_TYPE_DIRECTION_DOWN";
        case ApolloDIRECTION_TYPE_DIRECTION_FORCE: return @"ApolloDIRECTION_TYPE_DIRECTION_FORCE";
        case ApolloDIRECTION_TYPE_DIRECTION_All: return @"ApolloDIRECTION_TYPE_DIRECTION_All";
        default: return @"";
    }
}

+ (ApolloDIRECTION_TYPE)stoe:(NSString *)s
{
    if(isJceEnumStringEqual(s, @"ApolloDIRECTION_TYPE_DIRECTION_UP")) return ApolloDIRECTION_TYPE_DIRECTION_UP;
    if(isJceEnumStringEqual(s, @"ApolloDIRECTION_TYPE_DIRECTION_DOWN")) return ApolloDIRECTION_TYPE_DIRECTION_DOWN;
    if(isJceEnumStringEqual(s, @"ApolloDIRECTION_TYPE_DIRECTION_FORCE")) return ApolloDIRECTION_TYPE_DIRECTION_FORCE;
    if(isJceEnumStringEqual(s, @"ApolloDIRECTION_TYPE_DIRECTION_All")) return ApolloDIRECTION_TYPE_DIRECTION_All;
    return NSIntegerMin;
}

@end

#endif
