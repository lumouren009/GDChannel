//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/BusHookProxy.java
//

#ifndef _ComGoodowRealtimeChannelImplBusHookProxy_H_
#define _ComGoodowRealtimeChannelImplBusHookProxy_H_

@protocol ComGoodowRealtimeChannelMessage;
@protocol ComGoodowRealtimeCoreHandler;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/channel/BusHook.h"

@interface ComGoodowRealtimeChannelImplBusHookProxy : NSObject < ComGoodowRealtimeChannelBusHook > {
}

- (void)handleOpened;

- (void)handlePostClose;

- (jboolean)handlePreClose;

- (jboolean)handlePreSubscribeWithNSString:(NSString *)topic
          withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler;

- (jboolean)handleReceiveMessageWithComGoodowRealtimeChannelMessage:(id<ComGoodowRealtimeChannelMessage>)message;

- (jboolean)handleSendOrPubWithBoolean:(jboolean)send
                          withNSString:(NSString *)topic
                                withId:(id)msg
      withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (jboolean)handleUnsubscribeWithNSString:(NSString *)topic;

- (id<ComGoodowRealtimeChannelBusHook>)delegate;

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplBusHookProxy)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplBusHookProxy)

#endif // _ComGoodowRealtimeChannelImplBusHookProxy_H_