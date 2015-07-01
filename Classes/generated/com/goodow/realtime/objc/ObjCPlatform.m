//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/objc/ObjCPlatform.java
//

#include "J2ObjC_source.h"
#include "com/goodow/realtime/core/Diff.h"
#include "com/goodow/realtime/core/Net.h"
#include "com/goodow/realtime/core/Platform.h"
#include "com/goodow/realtime/core/Scheduler.h"
#include "com/goodow/realtime/objc/ObjCDiff.h"
#include "com/goodow/realtime/objc/ObjCNet.h"
#include "com/goodow/realtime/objc/ObjCPlatform.h"
#include "com/goodow/realtime/objc/ObjCScheduler.h"

@interface ComGoodowRealtimeObjcObjCPlatform () {
 @public
  id<ComGoodowRealtimeCoreNet> net__;
  ComGoodowRealtimeObjcObjCScheduler *scheduler__;
  ComGoodowRealtimeObjcObjCDiff *diff__;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeObjcObjCPlatform, net__, id<ComGoodowRealtimeCoreNet>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeObjcObjCPlatform, scheduler__, ComGoodowRealtimeObjcObjCScheduler *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeObjcObjCPlatform, diff__, ComGoodowRealtimeObjcObjCDiff *)

@implementation ComGoodowRealtimeObjcObjCPlatform

+ (void)register__ {
  ComGoodowRealtimeObjcObjCPlatform_register__();
}

+ (void)load {
  [ComGoodowRealtimeObjcObjCPlatform register__];
}

- (id<ComGoodowRealtimeCoreDiff>)diff {
  return diff__;
}

- (id<ComGoodowRealtimeCoreNet>)net {
  return net__;
}

- (id<ComGoodowRealtimeCoreScheduler>)scheduler {
  return scheduler__;
}

- (ComGoodowRealtimeCorePlatform_TypeEnum *)type {
  return ComGoodowRealtimeCorePlatform_TypeEnum_get_IOS();
}

- (instancetype)init {
  if (self = [super init]) {
    net__ = [[ComGoodowRealtimeObjcObjCNet alloc] init];
    scheduler__ = [[ComGoodowRealtimeObjcObjCScheduler alloc] init];
    diff__ = [[ComGoodowRealtimeObjcObjCDiff alloc] init];
  }
  return self;
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeObjcObjCPlatform *)other {
  [super copyAllFieldsTo:other];
  other->net__ = net__;
  other->scheduler__ = scheduler__;
  other->diff__ = diff__;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "register__", "register", "V", 0x9, NULL },
    { "diff", NULL, "Lcom.goodow.realtime.core.Diff;", 0x1, NULL },
    { "net", NULL, "Lcom.goodow.realtime.core.Net;", 0x1, NULL },
    { "scheduler", NULL, "Lcom.goodow.realtime.core.Scheduler;", 0x1, NULL },
    { "type", NULL, "Lcom.goodow.realtime.core.Platform$Type;", 0x1, NULL },
    { "init", NULL, NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "net__", "net", 0x12, "Lcom.goodow.realtime.core.Net;", NULL,  },
    { "scheduler__", "scheduler", 0x12, "Lcom.goodow.realtime.objc.ObjCScheduler;", NULL,  },
    { "diff__", "diff", 0x12, "Lcom.goodow.realtime.objc.ObjCDiff;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeObjcObjCPlatform = { 1, "ObjCPlatform", "com.goodow.realtime.objc", NULL, 0x0, 6, methods, 3, fields, 0, NULL};
  return &_ComGoodowRealtimeObjcObjCPlatform;
}

@end

void ComGoodowRealtimeObjcObjCPlatform_register__() {
  ComGoodowRealtimeObjcObjCPlatform_init();
  ComGoodowRealtimeCorePlatform_setFactoryWithComGoodowRealtimeCorePlatformFactory_([[ComGoodowRealtimeObjcObjCPlatform alloc] init]);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeObjcObjCPlatform)