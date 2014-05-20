//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/DefaultMessage.java
//
//  Created by retechretech.
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/channel/impl/DefaultMessage.h"
#include "com/goodow/realtime/core/Handler.h"

@implementation GDCDefaultMessage

- (id)initWithBoolean:(BOOL)local
          withBoolean:(BOOL)send
           withGDCBus:(id<GDCBus>)bus
         withNSString:(NSString *)address
         withNSString:(NSString *)replyAddress
               withId:(id)body {
  if (self = [super init]) {
    self->local_ = local;
    self->send_ = send;
    self->bus_ = bus;
    self->address__ = address;
    self->replyAddress__ = replyAddress;
    self->body__ = body;
  }
  return self;
}

- (NSString *)address {
  return address__;
}

- (id)body {
  return body__;
}

- (void)fail:(int)failureCode message:(NSString *)msg {
}

- (void)reply:(id)msg {
  [self sendReplyWithId:msg withComGoodowRealtimeCoreHandler:nil];
}

- (void)reply:(id)msg replyHandler:(id)replyHandler {
  [self sendReplyWithId:msg withComGoodowRealtimeCoreHandler:replyHandler];
}

- (NSString *)replyAddress {
  return replyAddress__;
}

- (NSString *)description {
  return body__ == nil ? nil : [body__ description];
}

- (void)sendReplyWithId:(id)msg
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  if (bus_ != nil && replyAddress__ != nil) {
    if (local_) {
      (void) [bus_ sendLocal:replyAddress__ message:msg replyHandler:replyHandler];
    }
    else {
      (void) [bus_ send:replyAddress__ message:msg replyHandler:replyHandler];
    }
  }
}

- (void)copyAllFieldsTo:(GDCDefaultMessage *)other {
  [super copyAllFieldsTo:other];
  other->address__ = address__;
  other->body__ = body__;
  other->bus_ = bus_;
  other->local_ = local_;
  other->replyAddress__ = replyAddress__;
  other->send_ = send_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithBoolean:withBoolean:withGDCBus:withNSString:withNSString:withId:", "DefaultMessage", NULL, 0x1, NULL },
    { "address", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "body", NULL, "TU;", 0x1, NULL },
    { "fail:message:", "fail", "V", 0x1, NULL },
    { "reply:", "reply", "V", 0x1, NULL },
    { "reply:replyHandler:", "reply", "V", 0x1, NULL },
    { "replyAddress", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "description", "toString", "Ljava.lang.String;", 0x1, NULL },
    { "sendReplyWithId:withComGoodowRealtimeCoreHandler:", "sendReply", "V", 0x2, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "body__", "body", 0x4, "TU;", NULL,  },
    { "bus_", NULL, 0x4, "Lcom.goodow.realtime.channel.Bus;", NULL,  },
    { "address__", "address", 0x4, "Ljava.lang.String;", NULL,  },
    { "replyAddress__", "replyAddress", 0x4, "Ljava.lang.String;", NULL,  },
    { "send_", NULL, 0x4, "Z", NULL,  },
    { "local_", NULL, 0x4, "Z", NULL,  },
  };
  static J2ObjcClassInfo _GDCDefaultMessage = { "DefaultMessage", "com.goodow.realtime.channel.impl", NULL, 0x0, 9, methods, 6, fields, 0, NULL};
  return &_GDCDefaultMessage;
}

@end
