//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/core/Platform.java
//
//  Created by retechretech.
//

#include "IOSClass.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/Net.h"
#include "com/goodow/realtime/core/Platform.h"
#include "com/goodow/realtime/core/PlatformFactory.h"
#include "java/lang/IllegalArgumentException.h"

@implementation ComGoodowRealtimeCorePlatform

static id<ComGoodowRealtimeCorePlatformFactory> ComGoodowRealtimeCorePlatform_FACTORY_;

+ (id<ComGoodowRealtimeCorePlatformFactory>)FACTORY {
  return ComGoodowRealtimeCorePlatform_FACTORY_;
}

+ (void)setFACTORY:(id<ComGoodowRealtimeCorePlatformFactory>)FACTORY {
  ComGoodowRealtimeCorePlatform_FACTORY_ = FACTORY;
}

+ (BOOL)cancelTimerWithInt:(int)id_ {
  return [((id<ComGoodowRealtimeCorePlatformFactory>) nil_chk([ComGoodowRealtimeCorePlatform get])) cancelTimerWithInt:id_];
}

+ (id<ComGoodowRealtimeCoreNet>)net {
  return [((id<ComGoodowRealtimeCorePlatformFactory>) nil_chk([ComGoodowRealtimeCorePlatform get])) net];
}

+ (void)scheduleDeferredWithComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  [((id<ComGoodowRealtimeCorePlatformFactory>) nil_chk([ComGoodowRealtimeCorePlatform get])) scheduleDeferredWithComGoodowRealtimeCoreHandler:handler];
}

+ (void)setFactoryWithComGoodowRealtimeCorePlatformFactory:(id<ComGoodowRealtimeCorePlatformFactory>)factory {
  ComGoodowRealtimeCorePlatform_FACTORY_ = factory;
}

+ (int)setPeriodicWithInt:(int)delayMs
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  return [((id<ComGoodowRealtimeCorePlatformFactory>) nil_chk([ComGoodowRealtimeCorePlatform get])) setPeriodicWithInt:delayMs withComGoodowRealtimeCoreHandler:handler];
}

+ (ComGoodowRealtimeCorePlatform_TypeEnum *)type {
  return [((id<ComGoodowRealtimeCorePlatformFactory>) nil_chk([ComGoodowRealtimeCorePlatform get])) type];
}

+ (id<ComGoodowRealtimeCorePlatformFactory>)get {
  NSAssert(ComGoodowRealtimeCorePlatform_FACTORY_ != nil, @"You must register a platform first by invoke {Java|Android}Platform.register()");
  return ComGoodowRealtimeCorePlatform_FACTORY_;
}

- (id)init {
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "cancelTimerWithInt:", "cancelTimer", "Z", 0x9, NULL },
    { "net", NULL, "Lcom.goodow.realtime.core.Net;", 0x9, NULL },
    { "scheduleDeferredWithComGoodowRealtimeCoreHandler:", "scheduleDeferred", "V", 0x9, NULL },
    { "setFactoryWithComGoodowRealtimeCorePlatformFactory:", "setFactory", "V", 0x9, NULL },
    { "setPeriodicWithInt:withComGoodowRealtimeCoreHandler:", "setPeriodic", "I", 0x9, NULL },
    { "type", NULL, "Lcom.goodow.realtime.core.Platform$Type;", 0x9, NULL },
    { "get", NULL, "Lcom.goodow.realtime.core.PlatformFactory;", 0xa, NULL },
    { "init", "Platform", NULL, 0x4, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "FACTORY_", NULL, 0xa, "Lcom.goodow.realtime.core.PlatformFactory;" },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeCorePlatform = { "Platform", "com.goodow.realtime.core", NULL, 0x1, 8, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeCorePlatform;
}

@end

static ComGoodowRealtimeCorePlatform_TypeEnum *ComGoodowRealtimeCorePlatform_TypeEnum_JAVA;
static ComGoodowRealtimeCorePlatform_TypeEnum *ComGoodowRealtimeCorePlatform_TypeEnum_HTML;
static ComGoodowRealtimeCorePlatform_TypeEnum *ComGoodowRealtimeCorePlatform_TypeEnum_ANDROID;
static ComGoodowRealtimeCorePlatform_TypeEnum *ComGoodowRealtimeCorePlatform_TypeEnum_IOS;
static ComGoodowRealtimeCorePlatform_TypeEnum *ComGoodowRealtimeCorePlatform_TypeEnum_FLASH;
static ComGoodowRealtimeCorePlatform_TypeEnum *ComGoodowRealtimeCorePlatform_TypeEnum_STUB;
IOSObjectArray *ComGoodowRealtimeCorePlatform_TypeEnum_values;

@implementation ComGoodowRealtimeCorePlatform_TypeEnum

+ (ComGoodowRealtimeCorePlatform_TypeEnum *)JAVA {
  return ComGoodowRealtimeCorePlatform_TypeEnum_JAVA;
}
+ (ComGoodowRealtimeCorePlatform_TypeEnum *)HTML {
  return ComGoodowRealtimeCorePlatform_TypeEnum_HTML;
}
+ (ComGoodowRealtimeCorePlatform_TypeEnum *)ANDROID {
  return ComGoodowRealtimeCorePlatform_TypeEnum_ANDROID;
}
+ (ComGoodowRealtimeCorePlatform_TypeEnum *)IOS {
  return ComGoodowRealtimeCorePlatform_TypeEnum_IOS;
}
+ (ComGoodowRealtimeCorePlatform_TypeEnum *)FLASH {
  return ComGoodowRealtimeCorePlatform_TypeEnum_FLASH;
}
+ (ComGoodowRealtimeCorePlatform_TypeEnum *)STUB {
  return ComGoodowRealtimeCorePlatform_TypeEnum_STUB;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal {
  return [super initWithNSString:__name withInt:__ordinal];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeCorePlatform_TypeEnum class]) {
    ComGoodowRealtimeCorePlatform_TypeEnum_JAVA = [[ComGoodowRealtimeCorePlatform_TypeEnum alloc] initWithNSString:@"JAVA" withInt:0];
    ComGoodowRealtimeCorePlatform_TypeEnum_HTML = [[ComGoodowRealtimeCorePlatform_TypeEnum alloc] initWithNSString:@"HTML" withInt:1];
    ComGoodowRealtimeCorePlatform_TypeEnum_ANDROID = [[ComGoodowRealtimeCorePlatform_TypeEnum alloc] initWithNSString:@"ANDROID" withInt:2];
    ComGoodowRealtimeCorePlatform_TypeEnum_IOS = [[ComGoodowRealtimeCorePlatform_TypeEnum alloc] initWithNSString:@"IOS" withInt:3];
    ComGoodowRealtimeCorePlatform_TypeEnum_FLASH = [[ComGoodowRealtimeCorePlatform_TypeEnum alloc] initWithNSString:@"FLASH" withInt:4];
    ComGoodowRealtimeCorePlatform_TypeEnum_STUB = [[ComGoodowRealtimeCorePlatform_TypeEnum alloc] initWithNSString:@"STUB" withInt:5];
    ComGoodowRealtimeCorePlatform_TypeEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ ComGoodowRealtimeCorePlatform_TypeEnum_JAVA, ComGoodowRealtimeCorePlatform_TypeEnum_HTML, ComGoodowRealtimeCorePlatform_TypeEnum_ANDROID, ComGoodowRealtimeCorePlatform_TypeEnum_IOS, ComGoodowRealtimeCorePlatform_TypeEnum_FLASH, ComGoodowRealtimeCorePlatform_TypeEnum_STUB, nil } count:6 type:[IOSClass classWithClass:[ComGoodowRealtimeCorePlatform_TypeEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:ComGoodowRealtimeCorePlatform_TypeEnum_values];
}

+ (ComGoodowRealtimeCorePlatform_TypeEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [ComGoodowRealtimeCorePlatform_TypeEnum_values count]; i++) {
    ComGoodowRealtimeCorePlatform_TypeEnum *e = ComGoodowRealtimeCorePlatform_TypeEnum_values->buffer_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const char *superclass_type_args[] = {"Lcom.goodow.realtime.core.Platform$Type;"};
  static J2ObjcClassInfo _ComGoodowRealtimeCorePlatform_TypeEnum = { "Type", "com.goodow.realtime.core", "Platform", 0x4019, 1, methods, 0, NULL, 1, superclass_type_args};
  return &_ComGoodowRealtimeCorePlatform_TypeEnum;
}

@end
