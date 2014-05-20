//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/SimpleBus.java
//
//  Created by retechretech.
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/channel/BusHook.h"
#include "com/goodow/realtime/channel/Message.h"
#include "com/goodow/realtime/channel/State.h"
#include "com/goodow/realtime/channel/impl/DefaultMessage.h"
#include "com/goodow/realtime/channel/impl/SimpleBus.h"
#include "com/goodow/realtime/channel/util/IdGenerator.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/HandlerRegistration.h"
#include "com/goodow/realtime/core/Platform.h"
#include "com/goodow/realtime/core/Scheduler.h"
#include "com/goodow/realtime/json/Json.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/Throwable.h"
#include "java/lang/Void.h"
#include "java/util/logging/Level.h"
#include "java/util/logging/Logger.h"

BOOL GDCSimpleBus_initialized = NO;

@implementation GDCSimpleBus

JavaUtilLoggingLogger * GDCSimpleBus_log_;

+ (void)checkNotNullWithNSString:(NSString *)paramName
                          withId:(id)param {
  if (param == nil) {
    @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:[NSString stringWithFormat:@"Parameter %@ must be specified", paramName]];
  }
}

- (id)init {
  if (self = [super init]) {
    handlerMap_ = [GDJson createObject];
    replyHandlers_ = [GDJson createObject];
    idGenerator_ = [[ComGoodowRealtimeChannelUtilIdGenerator alloc] init];
  }
  return self;
}

- (void)close {
  if (hook_ == nil || [hook_ handlePreClose]) {
    [self doClose];
  }
}

- (GDCStateEnum *)getReadyState {
  return handlerMap_ == nil ? GDCStateEnum_get_CLOSED() : GDCStateEnum_get_OPEN();
}

- (GDCSimpleBus *)publish:(NSString *)address message:(id)msg {
  [self internalHandleSendOrPubWithBoolean:NO withBoolean:NO withNSString:address withId:msg withComGoodowRealtimeCoreHandler:nil];
  return self;
}

- (id<GDCBus>)publishLocalWithNSString:(NSString *)address
                                withId:(id)msg {
  [self internalHandleSendOrPubWithBoolean:YES withBoolean:NO withNSString:address withId:msg withComGoodowRealtimeCoreHandler:nil];
  return self;
}

- (id<ComGoodowRealtimeCoreHandlerRegistration>)registerHandler:(NSString *)address handler:(id)handler {
  return [self registerHandlerImplWithBoolean:NO withNSString:address withComGoodowRealtimeCoreHandler:handler];
}

- (id<ComGoodowRealtimeCoreHandlerRegistration>)registerLocalHandler:(NSString *)address handler:(id)handler {
  return [self registerHandlerImplWithBoolean:YES withNSString:address withComGoodowRealtimeCoreHandler:handler];
}

- (GDCSimpleBus *)send:(NSString *)address message:(id)msg replyHandler:(id)replyHandler {
  [self internalHandleSendOrPubWithBoolean:NO withBoolean:YES withNSString:address withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
  return self;
}

- (id<GDCBus>)sendLocalWithNSString:(NSString *)address
                             withId:(id)msg
   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  [self internalHandleSendOrPubWithBoolean:YES withBoolean:YES withNSString:address withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
  return self;
}

- (GDCSimpleBus *)setHookWithGDCBusHook:(id<GDCBusHook>)hook {
  self->hook_ = hook;
  return self;
}

- (void)doClose {
  (void) [self publishLocalWithNSString:GDCBus_get_ON_CLOSE_() withId:nil];
  [self clearHandlers];
  if (hook_ != nil) {
    [hook_ handlePostClose];
  }
}

- (BOOL)doRegisterHandlerWithBoolean:(BOOL)local
                        withNSString:(NSString *)address
    withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  [GDCSimpleBus checkNotNullWithNSString:@"address" withId:address];
  [GDCSimpleBus checkNotNullWithNSString:@"handler" withId:handler];
  id<GDJsonArray> handlers = [((id<GDJsonObject>) nil_chk(handlerMap_)) getArray:address];
  if (handlers == nil) {
    (void) [handlerMap_ set:address value:[((id<GDJsonArray>) nil_chk([GDJson createArray])) push:handler]];
    return YES;
  }
  if ([((id<GDJsonArray>) nil_chk(handlers)) indexOf:handler] == -1) {
    (void) [handlers push:handler];
    return YES;
  }
  return NO;
}

- (void)doSendOrPubWithBoolean:(BOOL)local
                   withBoolean:(BOOL)send
                  withNSString:(NSString *)address
                        withId:(id)msg
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  [GDCSimpleBus checkNotNullWithNSString:@"address" withId:address];
  NSString *replyAddress = nil;
  if (replyHandler != nil) {
    replyAddress = [self makeUUID];
  }
  GDCDefaultMessage *message = [[GDCDefaultMessage alloc] initWithBoolean:local withBoolean:send withGDCBus:self withNSString:address withNSString:replyAddress withId:msg];
  if ([self internalHandleReceiveMessageWithBoolean:local withGDCMessage:message] && replyHandler != nil) {
    (void) [((id<GDJsonObject>) nil_chk(replyHandlers_)) set:replyAddress value:replyHandler];
  }
}

- (BOOL)doUnregisterHandlerWithBoolean:(BOOL)local
                          withNSString:(NSString *)address
      withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  [GDCSimpleBus checkNotNullWithNSString:@"address" withId:address];
  [GDCSimpleBus checkNotNullWithNSString:@"handler" withId:handler];
  id<GDJsonArray> handlers = [((id<GDJsonObject>) nil_chk(handlerMap_)) getArray:address];
  if (handlers == nil) {
    return NO;
  }
  BOOL removed = [((id<GDJsonArray>) nil_chk(handlers)) removeValue:handler];
  if ([handlers count] == 0) {
    (void) [handlerMap_ removeWithNSString:address];
  }
  return removed;
}

- (void)clearHandlers {
  (void) [((id<GDJsonObject>) nil_chk(replyHandlers_)) clear];
  (void) [((id<GDJsonObject>) nil_chk(handlerMap_)) clear];
  handlerMap_ = nil;
}

- (BOOL)internalHandleReceiveMessageWithBoolean:(BOOL)local
                                 withGDCMessage:(id<GDCMessage>)message {
  if (local || hook_ == nil || [hook_ handleReceiveMessageWithGDCMessage:message]) {
    [self doReceiveMessageWithGDCMessage:message];
    return YES;
  }
  return NO;
}

- (void)internalHandleSendOrPubWithBoolean:(BOOL)local
                               withBoolean:(BOOL)send
                              withNSString:(NSString *)address
                                    withId:(id)msg
          withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  if (local || hook_ == nil || [hook_ handleSendOrPubWithBoolean:send withNSString:address withId:msg withComGoodowRealtimeCoreHandler:replyHandler]) {
    [self doSendOrPubWithBoolean:local withBoolean:send withNSString:address withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
  }
}

- (NSString *)makeUUID {
  return [((ComGoodowRealtimeChannelUtilIdGenerator *) nil_chk(idGenerator_)) nextWithInt:36];
}

- (void)scheduleHandleWithNSString:(NSString *)address
                            withId:(id)handler
                            withId:(id)message {
  [((id<ComGoodowRealtimeCoreScheduler>) nil_chk([ComGoodowRealtimeCorePlatform scheduler])) scheduleDeferredWithComGoodowRealtimeCoreHandler:[[GDCSimpleBus_$1 alloc] initWithGDCSimpleBus:self withId:handler withId:message withNSString:address]];
}

- (void)doReceiveMessageWithGDCMessage:(id<GDCMessage>)message {
  NSString *address = [((id<GDCMessage>) nil_chk(message)) address];
  id<GDJsonArray> handlers = [((id<GDJsonObject>) nil_chk(handlerMap_)) getArray:address];
  if (handlers != nil) {
    [handlers forEach:[[GDCSimpleBus_$2 alloc] initWithGDCSimpleBus:self withNSString:address withGDCMessage:message]];
  }
  else {
    id handler = [((id<GDJsonObject>) nil_chk(replyHandlers_)) getWithNSString:address];
    if (handler != nil) {
      (void) [replyHandlers_ removeWithNSString:address];
      [self scheduleHandleWithNSString:address withId:handler withId:message];
    }
  }
}

- (id<ComGoodowRealtimeCoreHandlerRegistration>)registerHandlerImplWithBoolean:(BOOL)local
                                                                  withNSString:(NSString *)address
                                              withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  [self doRegisterHandlerWithBoolean:local withNSString:address withComGoodowRealtimeCoreHandler:handler];
  return [[GDCSimpleBus_$3 alloc] initWithGDCSimpleBus:self withBoolean:local withNSString:address withComGoodowRealtimeCoreHandler:handler];
}

+ (void)initialize {
  if (self == [GDCSimpleBus class]) {
    GDCSimpleBus_log_ = [JavaUtilLoggingLogger getLoggerWithNSString:[[IOSClass classWithClass:[GDCSimpleBus class]] getName]];
    GDCSimpleBus_initialized = YES;
  }
}

- (void)copyAllFieldsTo:(GDCSimpleBus *)other {
  [super copyAllFieldsTo:other];
  other->handlerMap_ = handlerMap_;
  other->hook_ = hook_;
  other->idGenerator_ = idGenerator_;
  other->replyHandlers_ = replyHandlers_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "checkNotNullWithNSString:withId:", "checkNotNull", "V", 0x8, NULL },
    { "init", "SimpleBus", NULL, 0x1, NULL },
    { "close", NULL, "V", 0x1, NULL },
    { "getReadyState", NULL, "Lcom.goodow.realtime.channel.State;", 0x1, NULL },
    { "publish:message:", "publish", "Lcom.goodow.realtime.channel.impl.SimpleBus;", 0x1, NULL },
    { "publishLocalWithNSString:withId:", "publishLocal", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "registerHandler:handler:", "registerHandler", "Lcom.goodow.realtime.core.HandlerRegistration;", 0x1, NULL },
    { "registerLocalHandler:handler:", "registerLocalHandler", "Lcom.goodow.realtime.core.HandlerRegistration;", 0x1, NULL },
    { "send:message:replyHandler:", "send", "Lcom.goodow.realtime.channel.impl.SimpleBus;", 0x1, NULL },
    { "sendLocalWithNSString:withId:withComGoodowRealtimeCoreHandler:", "sendLocal", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "setHookWithGDCBusHook:", "setHook", "Lcom.goodow.realtime.channel.impl.SimpleBus;", 0x1, NULL },
    { "doClose", NULL, "V", 0x4, NULL },
    { "doRegisterHandlerWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "doRegisterHandler", "Z", 0x4, NULL },
    { "doSendOrPubWithBoolean:withBoolean:withNSString:withId:withComGoodowRealtimeCoreHandler:", "doSendOrPub", "V", 0x4, NULL },
    { "doUnregisterHandlerWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "doUnregisterHandler", "Z", 0x4, NULL },
    { "clearHandlers", NULL, "V", 0x0, NULL },
    { "internalHandleReceiveMessageWithBoolean:withGDCMessage:", "internalHandleReceiveMessage", "Z", 0x0, NULL },
    { "internalHandleSendOrPubWithBoolean:withBoolean:withNSString:withId:withComGoodowRealtimeCoreHandler:", "internalHandleSendOrPub", "V", 0x0, NULL },
    { "makeUUID", NULL, "Ljava.lang.String;", 0x0, NULL },
    { "scheduleHandleWithNSString:withId:withId:", "scheduleHandle", "V", 0x0, NULL },
    { "doReceiveMessageWithGDCMessage:", "doReceiveMessage", "V", 0x2, NULL },
    { "registerHandlerImplWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "registerHandlerImpl", "Lcom.goodow.realtime.core.HandlerRegistration;", 0x2, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "log_", NULL, 0x1a, "Ljava.util.logging.Logger;", &GDCSimpleBus_log_,  },
    { "handlerMap_", NULL, 0x2, "Lcom.goodow.realtime.json.JsonObject;", NULL,  },
    { "replyHandlers_", NULL, 0x10, "Lcom.goodow.realtime.json.JsonObject;", NULL,  },
    { "hook_", NULL, 0x0, "Lcom.goodow.realtime.channel.BusHook;", NULL,  },
    { "idGenerator_", NULL, 0x12, "Lcom.goodow.realtime.channel.util.IdGenerator;", NULL,  },
  };
  static J2ObjcClassInfo _GDCSimpleBus = { "SimpleBus", "com.goodow.realtime.channel.impl", NULL, 0x1, 22, methods, 5, fields, 0, NULL};
  return &_GDCSimpleBus;
}

@end

@implementation GDCSimpleBus_$1

- (void)handleWithId:(id)ignore {
  @try {
    [((id<ComGoodowRealtimeCoreScheduler>) nil_chk([ComGoodowRealtimeCorePlatform scheduler])) handleWithId:val$handler_ withId:val$message_];
  }
  @catch (JavaLangThrowable *e) {
    [((JavaUtilLoggingLogger *) nil_chk(GDCSimpleBus_get_log_())) logWithJavaUtilLoggingLevel:JavaUtilLoggingLevel_get_WARNING_() withNSString:[NSString stringWithFormat:@"Failed to handle on address: %@", val$address_] withJavaLangThrowable:e];
    (void) [this$0_ publishLocalWithNSString:GDCBus_get_ON_ERROR_() withId:[((id<GDJsonObject>) nil_chk([((id<GDJsonObject>) nil_chk([((id<GDJsonObject>) nil_chk([GDJson createObject])) set:@"address" value:val$address_])) set:@"message" value:val$message_])) set:@"cause" value:e]];
  }
}

- (id)initWithGDCSimpleBus:(GDCSimpleBus *)outer$
                    withId:(id)capture$0
                    withId:(id)capture$1
              withNSString:(NSString *)capture$2 {
  this$0_ = outer$;
  val$handler_ = capture$0;
  val$message_ = capture$1;
  val$address_ = capture$2;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "handleWithJavaLangVoid:", "handle", "V", 0x1, NULL },
    { "initWithGDCSimpleBus:withId:withId:withNSString:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.SimpleBus;", NULL,  },
    { "val$handler_", NULL, 0x1012, "Ljava.lang.Object;", NULL,  },
    { "val$message_", NULL, 0x1012, "Ljava.lang.Object;", NULL,  },
    { "val$address_", NULL, 0x1012, "Ljava.lang.String;", NULL,  },
  };
  static J2ObjcClassInfo _GDCSimpleBus_$1 = { "$1", "com.goodow.realtime.channel.impl", "SimpleBus", 0x8000, 2, methods, 4, fields, 0, NULL};
  return &_GDCSimpleBus_$1;
}

@end

@implementation GDCSimpleBus_$2

- (void)callWithInt:(int)index
             withId:(id)value {
  [this$0_ scheduleHandleWithNSString:val$address_ withId:value withId:val$message_];
}

- (id)initWithGDCSimpleBus:(GDCSimpleBus *)outer$
              withNSString:(NSString *)capture$0
            withGDCMessage:(id<GDCMessage>)capture$1 {
  this$0_ = outer$;
  val$address_ = capture$0;
  val$message_ = capture$1;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "callWithInt:withId:", "call", "V", 0x1, NULL },
    { "initWithGDCSimpleBus:withNSString:withGDCMessage:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.SimpleBus;", NULL,  },
    { "val$address_", NULL, 0x1012, "Ljava.lang.String;", NULL,  },
    { "val$message_", NULL, 0x1012, "Lcom.goodow.realtime.channel.Message;", NULL,  },
  };
  static J2ObjcClassInfo _GDCSimpleBus_$2 = { "$2", "com.goodow.realtime.channel.impl", "SimpleBus", 0x8000, 2, methods, 3, fields, 0, NULL};
  return &_GDCSimpleBus_$2;
}

@end

@implementation GDCSimpleBus_$3

- (void)unregisterHandler {
  [this$0_ doUnregisterHandlerWithBoolean:val$local_ withNSString:val$address_ withComGoodowRealtimeCoreHandler:val$handler_];
}

- (id)initWithGDCSimpleBus:(GDCSimpleBus *)outer$
               withBoolean:(BOOL)capture$0
              withNSString:(NSString *)capture$1
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)capture$2 {
  this$0_ = outer$;
  val$local_ = capture$0;
  val$address_ = capture$1;
  val$handler_ = capture$2;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "unregisterHandler", NULL, "V", 0x1, NULL },
    { "initWithGDCSimpleBus:withBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.SimpleBus;", NULL,  },
    { "val$local_", NULL, 0x1012, "Z", NULL,  },
    { "val$address_", NULL, 0x1012, "Ljava.lang.String;", NULL,  },
    { "val$handler_", NULL, 0x1012, "Lcom.goodow.realtime.core.Handler;", NULL,  },
  };
  static J2ObjcClassInfo _GDCSimpleBus_$3 = { "$3", "com.goodow.realtime.channel.impl", "SimpleBus", 0x8000, 2, methods, 4, fields, 0, NULL};
  return &_GDCSimpleBus_$3;
}

@end
