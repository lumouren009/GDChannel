//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/ReconnectBus.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeChannelImplReconnectBus_H_
#define _ComGoodowRealtimeChannelImplReconnectBus_H_

@class ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator;
@class JavaLangVoid;
@protocol ComGoodowRealtimeChannelBus;
@protocol ComGoodowRealtimeChannelBusHook;
@protocol ComGoodowRealtimeJsonJsonArray;
@protocol ComGoodowRealtimeJsonJsonObject;

#import "JreEmulation.h"
#include "com/goodow/realtime/channel/impl/BusHookProxy.h"
#include "com/goodow/realtime/channel/impl/WebSocketBus.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/json/JsonArray.h"

@interface ComGoodowRealtimeChannelImplReconnectBus : ComGoodowRealtimeChannelImplWebSocketBus {
 @public
  ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator *backOffGenerator_;
  id<ComGoodowRealtimeChannelBusHook> hook_ReconnectBus_;
  BOOL reconnect__;
  id<ComGoodowRealtimeJsonJsonArray> queuedMessages_;
  id<ComGoodowRealtimeJsonJsonObject> options_;
}

- (id)initWithNSString:(NSString *)url
withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options;

- (void)reconnect;

- (id<ComGoodowRealtimeChannelBus>)setHookWithComGoodowRealtimeChannelBusHook:(id<ComGoodowRealtimeChannelBusHook>)hook;

- (void)doClose;

- (void)sendWithComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)msg;

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplReconnectBus *)other;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelImplReconnectBus_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus, backOffGenerator_, ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus, hook_ReconnectBus_, id<ComGoodowRealtimeChannelBusHook>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus, queuedMessages_, id<ComGoodowRealtimeJsonJsonArray>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus, options_, id<ComGoodowRealtimeJsonJsonObject>)

FOUNDATION_EXPORT NSString *ComGoodowRealtimeChannelImplReconnectBus_AUTO_RECONNECT_;
J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeChannelImplReconnectBus, AUTO_RECONNECT_, NSString *)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1 : ComGoodowRealtimeChannelImplBusHookProxy {
 @public
  ComGoodowRealtimeChannelImplReconnectBus *this$0_;
}

- (void)handleOpened;

- (void)handlePostClose;

- (id<ComGoodowRealtimeChannelBusHook>)delegate;

- (id)initWithComGoodowRealtimeChannelImplReconnectBus:(ComGoodowRealtimeChannelImplReconnectBus *)outer$;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelImplReconnectBus_$1_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus_$1, this$0_, ComGoodowRealtimeChannelImplReconnectBus *)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1_$1 : NSObject < ComGoodowRealtimeJsonJsonArray_ListIterator > {
 @public
  ComGoodowRealtimeChannelImplReconnectBus_$1 *this$0_;
}

- (void)callWithInt:(int)index
             withId:(NSString *)address;

- (id)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelImplReconnectBus_$1_$1_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus_$1_$1, this$0_, ComGoodowRealtimeChannelImplReconnectBus_$1 *)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1_$2 : NSObject < ComGoodowRealtimeJsonJsonArray_ListIterator > {
 @public
  ComGoodowRealtimeChannelImplReconnectBus_$1 *this$0_;
}

- (void)callWithInt:(int)index
             withId:(id<ComGoodowRealtimeJsonJsonObject>)msg;

- (id)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelImplReconnectBus_$1_$2_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus_$1_$2, this$0_, ComGoodowRealtimeChannelImplReconnectBus_$1 *)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1_$3 : NSObject < ComGoodowRealtimeCoreHandler > {
 @public
  ComGoodowRealtimeChannelImplReconnectBus_$1 *this$0_;
}

- (void)handleWithId:(id)event;

- (id)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelImplReconnectBus_$1_$3_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplReconnectBus_$1_$3, this$0_, ComGoodowRealtimeChannelImplReconnectBus_$1 *)

#endif // _ComGoodowRealtimeChannelImplReconnectBus_H_
