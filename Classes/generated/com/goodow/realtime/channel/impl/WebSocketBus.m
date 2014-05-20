//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/WebSocketBus.java
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
#include "com/goodow/realtime/channel/impl/WebSocketBus.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/HandlerRegistration.h"
#include "com/goodow/realtime/core/Net.h"
#include "com/goodow/realtime/core/Platform.h"
#include "com/goodow/realtime/core/Scheduler.h"
#include "com/goodow/realtime/core/WebSocket.h"
#include "com/goodow/realtime/json/Json.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "java/lang/IllegalStateException.h"
#include "java/lang/Void.h"

@implementation GDCWebSocketBus

NSString * GDCWebSocketBus_PING_INTERVAL_ = @"vertxbus_ping_interval";
NSString * GDCWebSocketBus_AUTH_ADDRESS_ = @"auth_address";
NSString * GDCWebSocketBus_BODY_ = @"body";
NSString * GDCWebSocketBus_ADDRESS_ = @"address";
NSString * GDCWebSocketBus_REPLY_ADDRESS_ = @"replyAddress";
NSString * GDCWebSocketBus_TYPE_ = @"type";

- (id)initWithNSString:(NSString *)url
      withGDJsonObject:(id<GDJsonObject>)options {
  if (self = [super init]) {
    pingTimerID_ = -1;
    handlerCount_ = [GDJson createObject];
    webSocketHandler_ = [[GDCWebSocketBus_$1 alloc] initWithGDCWebSocketBus:self];
    [self connectWithNSString:url withGDJsonObject:options];
  }
  return self;
}

- (void)connectWithNSString:(NSString *)url
           withGDJsonObject:(id<GDJsonObject>)options {
  self->url_ = url;
  pingInterval_ = options == nil || ![options has:GDCWebSocketBus_PING_INTERVAL_] ? 5 * 1000 : (int) [options getNumber:GDCWebSocketBus_PING_INTERVAL_];
  authAddress_ = options == nil || ![options has:GDCWebSocketBus_AUTH_ADDRESS_] ? @"realtime.auth" : [options getString:GDCWebSocketBus_AUTH_ADDRESS_];
  webSocket_ = [((id<ComGoodowRealtimeCoreNet>) nil_chk([ComGoodowRealtimeCorePlatform net])) createWebSocketWithNSString:url withGDJsonObject:options];
  [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) setListenWithComGoodowRealtimeCoreWebSocket_WebSocketHandler:webSocketHandler_];
}

- (GDCStateEnum *)getReadyState {
  return [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) getReadyState];
}

- (void)login:(NSString *)userId token:(NSString *)token replyHandler:(id)replyHandler {
  id<GDJsonObject> msg = [((id<GDJsonObject>) nil_chk([((id<GDJsonObject>) nil_chk([GDJson createObject])) set:@"userId" value:userId])) set:@"token" value:token];
  (void) [self send:[NSString stringWithFormat:@"%@.login", authAddress_] message:msg replyHandler:[[GDCWebSocketBus_$2 alloc] initWithGDCWebSocketBus:self withComGoodowRealtimeCoreHandler:replyHandler]];
}

- (void)doClose {
  [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) close];
  (void) [self registerLocalHandler:GDCBus_get_ON_CLOSE_() handler:[[GDCWebSocketBus_$3 alloc] initWithGDCWebSocketBus:self]];
}

- (BOOL)doRegisterHandlerWithBoolean:(BOOL)local
                        withNSString:(NSString *)address
    withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  BOOL registered = [super doRegisterHandlerWithBoolean:local withNSString:address withComGoodowRealtimeCoreHandler:handler];
  if (local || !registered || (hook_ != nil && ![hook_ handlePreRegisterWithNSString:address withComGoodowRealtimeCoreHandler:handler])) {
    return NO;
  }
  if ([((id<GDJsonObject>) nil_chk(handlerCount_)) has:address]) {
    (void) [handlerCount_ set:address number:[handlerCount_ getNumber:address] + 1];
    return NO;
  }
  (void) [handlerCount_ set:address number:1];
  [self sendRegisterWithNSString:address];
  return YES;
}

- (void)doSendOrPubWithBoolean:(BOOL)local
                   withBoolean:(BOOL)send
                  withNSString:(NSString *)address
                        withId:(id)msg
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  [GDCSimpleBus checkNotNullWithNSString:GDCWebSocketBus_ADDRESS_ withId:address];
  if (local) {
    [super doSendOrPubWithBoolean:local withBoolean:send withNSString:address withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
    return;
  }
  id<GDJsonObject> envelope = [((id<GDJsonObject>) nil_chk([GDJson createObject])) set:GDCWebSocketBus_TYPE_ value:send ? @"send" : @"publish"];
  (void) [((id<GDJsonObject>) nil_chk([((id<GDJsonObject>) nil_chk(envelope)) set:GDCWebSocketBus_ADDRESS_ value:address])) set:GDCWebSocketBus_BODY_ value:msg];
  if (accessToken_ != nil) {
    (void) [envelope set:@"sessionID" value:accessToken_];
  }
  if (sid_ != nil) {
    (void) [envelope set:@"sid" value:accessToken_];
  }
  if (replyHandler != nil) {
    NSString *replyAddress = [self makeUUID];
    (void) [envelope set:GDCWebSocketBus_REPLY_ADDRESS_ value:replyAddress];
    (void) [((id<GDJsonObject>) nil_chk(replyHandlers_)) set:replyAddress value:replyHandler];
  }
  [self sendWithGDJsonObject:envelope];
}

- (BOOL)doUnregisterHandlerWithBoolean:(BOOL)local
                          withNSString:(NSString *)address
      withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  BOOL unregistered = [super doUnregisterHandlerWithBoolean:local withNSString:address withComGoodowRealtimeCoreHandler:handler];
  if (local || !unregistered || (hook_ != nil && ![hook_ handleUnregisterWithNSString:address])) {
    return NO;
  }
  (void) [handlerCount_ set:address number:[((id<GDJsonObject>) nil_chk(handlerCount_)) getNumber:address] - 1];
  if ([handlerCount_ getNumber:address] == 0) {
    (void) [handlerCount_ removeWithNSString:address];
    [self sendUnregisterWithNSString:address];
    return YES;
  }
  return NO;
}

- (void)sendWithGDJsonObject:(id<GDJsonObject>)msg {
  if ([self getReadyState] != GDCStateEnum_get_OPEN()) {
    @throw [[JavaLangIllegalStateException alloc] initWithNSString:@"INVALID_STATE_ERR"];
  }
  [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) sendWithNSString:[((id<GDJsonObject>) nil_chk(msg)) toJsonString]];
}

- (void)sendPing {
  [self sendWithGDJsonObject:[((id<GDJsonObject>) nil_chk([GDJson createObject])) set:GDCWebSocketBus_TYPE_ value:@"ping"]];
}

- (void)sendRegisterWithNSString:(NSString *)address {
  NSAssert(address != nil, @"address shouldn't be null");
  id<GDJsonObject> msg = [((id<GDJsonObject>) nil_chk([((id<GDJsonObject>) nil_chk([GDJson createObject])) set:GDCWebSocketBus_TYPE_ value:@"register"])) set:GDCWebSocketBus_ADDRESS_ value:address];
  [self sendWithGDJsonObject:msg];
}

- (void)sendUnregisterWithNSString:(NSString *)address {
  id<GDJsonObject> msg = [((id<GDJsonObject>) nil_chk([((id<GDJsonObject>) nil_chk([GDJson createObject])) set:GDCWebSocketBus_TYPE_ value:@"unregister"])) set:GDCWebSocketBus_ADDRESS_ value:address];
  [self sendWithGDJsonObject:msg];
}

- (void)copyAllFieldsTo:(GDCWebSocketBus *)other {
  [super copyAllFieldsTo:other];
  other->accessToken_ = accessToken_;
  other->authAddress_ = authAddress_;
  other->handlerCount_ = handlerCount_;
  other->pingInterval_ = pingInterval_;
  other->pingTimerID_ = pingTimerID_;
  other->sid_ = sid_;
  other->url_ = url_;
  other->webSocket_ = webSocket_;
  other->webSocketHandler_ = webSocketHandler_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithNSString:withGDJsonObject:", "WebSocketBus", NULL, 0x1, NULL },
    { "connectWithNSString:withGDJsonObject:", "connect", "V", 0x1, NULL },
    { "getReadyState", NULL, "Lcom.goodow.realtime.channel.State;", 0x1, NULL },
    { "login:token:replyHandler:", "login", "V", 0x1, NULL },
    { "doClose", NULL, "V", 0x4, NULL },
    { "doRegisterHandlerWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "doRegisterHandler", "Z", 0x4, NULL },
    { "doSendOrPubWithBoolean:withBoolean:withNSString:withId:withComGoodowRealtimeCoreHandler:", "doSendOrPub", "V", 0x4, NULL },
    { "doUnregisterHandlerWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "doUnregisterHandler", "Z", 0x4, NULL },
    { "sendWithGDJsonObject:", "send", "V", 0x4, NULL },
    { "sendPing", NULL, "V", 0x4, NULL },
    { "sendRegisterWithNSString:", "sendRegister", "V", 0x4, NULL },
    { "sendUnregisterWithNSString:", "sendUnregister", "V", 0x4, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "PING_INTERVAL_", NULL, 0x19, "Ljava.lang.String;", &GDCWebSocketBus_PING_INTERVAL_,  },
    { "AUTH_ADDRESS_", NULL, 0x19, "Ljava.lang.String;", &GDCWebSocketBus_AUTH_ADDRESS_,  },
    { "BODY_", NULL, 0x1c, "Ljava.lang.String;", &GDCWebSocketBus_BODY_,  },
    { "ADDRESS_", NULL, 0x1c, "Ljava.lang.String;", &GDCWebSocketBus_ADDRESS_,  },
    { "REPLY_ADDRESS_", NULL, 0x1c, "Ljava.lang.String;", &GDCWebSocketBus_REPLY_ADDRESS_,  },
    { "TYPE_", NULL, 0x1c, "Ljava.lang.String;", &GDCWebSocketBus_TYPE_,  },
    { "webSocketHandler_", NULL, 0x12, "Lcom.goodow.realtime.core.WebSocket$WebSocketHandler;", NULL,  },
    { "url_", NULL, 0x0, "Ljava.lang.String;", NULL,  },
    { "webSocket_", NULL, 0x0, "Lcom.goodow.realtime.core.WebSocket;", NULL,  },
    { "pingInterval_", NULL, 0x2, "I", NULL,  },
    { "authAddress_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
    { "pingTimerID_", NULL, 0x2, "I", NULL,  },
    { "accessToken_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
    { "sid_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
    { "handlerCount_", NULL, 0x10, "Lcom.goodow.realtime.json.JsonObject;", NULL,  },
  };
  static J2ObjcClassInfo _GDCWebSocketBus = { "WebSocketBus", "com.goodow.realtime.channel.impl", NULL, 0x1, 12, methods, 15, fields, 0, NULL};
  return &_GDCWebSocketBus;
}

@end

@implementation GDCWebSocketBus_$1

- (void)onCloseWithGDJsonObject:(id<GDJsonObject>)reason {
  [((id<ComGoodowRealtimeCoreScheduler>) nil_chk([ComGoodowRealtimeCorePlatform scheduler])) cancelTimerWithInt:this$0_->pingTimerID_];
  (void) [this$0_ publishLocalWithNSString:GDCBus_get_ON_CLOSE_() withId:reason];
  if (this$0_->hook_ != nil) {
    [this$0_->hook_ handlePostClose];
  }
}

- (void)onErrorWithNSString:(NSString *)error {
  (void) [this$0_ publishLocalWithNSString:GDCBus_get_ON_ERROR_() withId:[((id<GDJsonObject>) nil_chk([GDJson createObject])) set:@"message" value:error]];
}

- (void)onMessageWithNSString:(NSString *)msg {
  id<GDJsonObject> json = [GDJson parseWithNSString:msg];
  GDCDefaultMessage *message = [[GDCDefaultMessage alloc] initWithBoolean:NO withBoolean:NO withGDCBus:this$0_ withNSString:[((id<GDJsonObject>) nil_chk(json)) getString:GDCWebSocketBus_get_ADDRESS_()] withNSString:[json getString:GDCWebSocketBus_get_REPLY_ADDRESS_()] withId:[json getWithNSString:GDCWebSocketBus_get_BODY_()]];
  [this$0_ internalHandleReceiveMessageWithBoolean:NO withGDCMessage:message];
}

- (void)onOpen {
  [this$0_ sendPing];
  this$0_->pingTimerID_ = [((id<ComGoodowRealtimeCoreScheduler>) nil_chk([ComGoodowRealtimeCorePlatform scheduler])) schedulePeriodicWithInt:this$0_->pingInterval_ withComGoodowRealtimeCoreHandler:[[GDCWebSocketBus_$1_$1 alloc] initWithGDCWebSocketBus_$1:self]];
  if (this$0_->hook_ != nil) {
    [this$0_->hook_ handleOpened];
  }
  (void) [this$0_ publishLocalWithNSString:GDCBus_get_ON_OPEN_() withId:nil];
}

- (id)initWithGDCWebSocketBus:(GDCWebSocketBus *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "onCloseWithGDJsonObject:", "onClose", "V", 0x1, NULL },
    { "onErrorWithNSString:", "onError", "V", 0x1, NULL },
    { "onMessageWithNSString:", "onMessage", "V", 0x1, NULL },
    { "onOpen", NULL, "V", 0x1, NULL },
    { "initWithGDCWebSocketBus:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus;", NULL,  },
  };
  static J2ObjcClassInfo _GDCWebSocketBus_$1 = { "$1", "com.goodow.realtime.channel.impl", "WebSocketBus", 0x8000, 5, methods, 1, fields, 0, NULL};
  return &_GDCWebSocketBus_$1;
}

@end

@implementation GDCWebSocketBus_$1_$1

- (void)handleWithId:(id)ignore {
  [this$0_->this$0_ sendPing];
}

- (id)initWithGDCWebSocketBus_$1:(GDCWebSocketBus_$1 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "handleWithJavaLangVoid:", "handle", "V", 0x1, NULL },
    { "initWithGDCWebSocketBus_$1:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus$1;", NULL,  },
  };
  static J2ObjcClassInfo _GDCWebSocketBus_$1_$1 = { "$1", "com.goodow.realtime.channel.impl", "WebSocketBus$$1", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_GDCWebSocketBus_$1_$1;
}

@end

@implementation GDCWebSocketBus_$2

- (void)handleWithId:(id<GDCMessage>)msg {
  id<GDJsonObject> body = [((id<GDCMessage>) nil_chk(msg)) body];
  if ([@"ok" isEqual:[((id<GDJsonObject>) nil_chk(body)) getString:@"status"]]) {
    this$0_->accessToken_ = [body getString:@"access_token"];
    this$0_->sid_ = [body getString:@"sid"];
  }
  if (val$replyHandler_ != nil) {
    (void) [body removeWithNSString:@"access_token"];
    [this$0_ scheduleHandleWithNSString:[NSString stringWithFormat:@"%@.login", this$0_->authAddress_] withId:val$replyHandler_ withId:body];
  }
}

- (id)initWithGDCWebSocketBus:(GDCWebSocketBus *)outer$
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)capture$0 {
  this$0_ = outer$;
  val$replyHandler_ = capture$0;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "handleWithGDCMessage:", "handle", "V", 0x1, NULL },
    { "initWithGDCWebSocketBus:withComGoodowRealtimeCoreHandler:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus;", NULL,  },
    { "val$replyHandler_", NULL, 0x1012, "Lcom.goodow.realtime.core.Handler;", NULL,  },
  };
  static J2ObjcClassInfo _GDCWebSocketBus_$2 = { "$2", "com.goodow.realtime.channel.impl", "WebSocketBus", 0x8000, 2, methods, 2, fields, 0, NULL};
  return &_GDCWebSocketBus_$2;
}

@end

@implementation GDCWebSocketBus_$3

- (void)handleWithId:(id<GDCMessage>)event {
  [this$0_ clearHandlers];
  (void) [((id<GDJsonObject>) nil_chk(this$0_->handlerCount_)) clear];
}

- (id)initWithGDCWebSocketBus:(GDCWebSocketBus *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "handleWithGDCMessage:", "handle", "V", 0x1, NULL },
    { "initWithGDCWebSocketBus:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus;", NULL,  },
  };
  static J2ObjcClassInfo _GDCWebSocketBus_$3 = { "$3", "com.goodow.realtime.channel.impl", "WebSocketBus", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_GDCWebSocketBus_$3;
}

@end
