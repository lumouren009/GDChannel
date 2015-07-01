//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/BusProxy.java
//

#ifndef _ComGoodowRealtimeChannelImplBusProxy_H_
#define _ComGoodowRealtimeChannelImplBusProxy_H_

@class ComGoodowRealtimeChannelStateEnum;
@protocol ComGoodowRealtimeChannelBusHook;
@protocol ComGoodowRealtimeCoreHandler;
@protocol ComGoodowRealtimeCoreRegistration;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/channel/Bus.h"

@interface ComGoodowRealtimeChannelImplBusProxy : NSObject < ComGoodowRealtimeChannelBus > {
 @public
  id<ComGoodowRealtimeChannelBus> delegate_;
  id<ComGoodowRealtimeChannelBusHook> hook_;
}

- (instancetype)initWithComGoodowRealtimeChannelBus:(id<ComGoodowRealtimeChannelBus>)delegate;

- (void)close;

- (id<ComGoodowRealtimeChannelBus>)getDelegate;

- (ComGoodowRealtimeChannelStateEnum *)getReadyState;

- (NSString *)getSessionId;

- (id<ComGoodowRealtimeChannelBus>)publishWithNSString:(NSString *)topic
                                                withId:(id)msg;

- (id<ComGoodowRealtimeChannelBus>)publishLocalWithNSString:(NSString *)topic
                                                     withId:(id)msg;

- (id<ComGoodowRealtimeCoreRegistration>)subscribeWithNSString:(NSString *)topic
                              withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler;

- (id<ComGoodowRealtimeCoreRegistration>)subscribeLocalWithNSString:(NSString *)topic
                                   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler;

- (id<ComGoodowRealtimeChannelBus>)sendWithNSString:(NSString *)topic
                                             withId:(id)msg
                   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (id<ComGoodowRealtimeChannelBus>)sendLocalWithNSString:(NSString *)topic
                                                  withId:(id)msg
                        withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (id<ComGoodowRealtimeChannelBus>)setHookWithComGoodowRealtimeChannelBusHook:(id<ComGoodowRealtimeChannelBusHook>)hook;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplBusProxy)

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplBusProxy, delegate_, id<ComGoodowRealtimeChannelBus>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplBusProxy, hook_, id<ComGoodowRealtimeChannelBusHook>)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplBusProxy)

#endif // _ComGoodowRealtimeChannelImplBusProxy_H_