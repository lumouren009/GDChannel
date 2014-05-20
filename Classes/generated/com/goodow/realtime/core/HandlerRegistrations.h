//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/core/HandlerRegistrations.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeCoreHandlerRegistrations_H_
#define _ComGoodowRealtimeCoreHandlerRegistrations_H_

@protocol GDJsonArray;

#import "JreEmulation.h"
#include "com/goodow/realtime/core/HandlerRegistration.h"
#include "com/goodow/realtime/json/JsonArray.h"

@interface ComGoodowRealtimeCoreHandlerRegistrations : NSObject < ComGoodowRealtimeCoreHandlerRegistration > {
 @public
  id<GDJsonArray> registrations_;
}

- (ComGoodowRealtimeCoreHandlerRegistrations *)addWithComGoodowRealtimeCoreHandlerRegistration:(id<ComGoodowRealtimeCoreHandlerRegistration>)registration;

- (void)unregisterHandler;

- (id<ComGoodowRealtimeCoreHandlerRegistration>)wrapWithComGoodowRealtimeCoreHandlerRegistration:(id<ComGoodowRealtimeCoreHandlerRegistration>)registration;

- (id)init;

- (void)copyAllFieldsTo:(ComGoodowRealtimeCoreHandlerRegistrations *)other;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeCoreHandlerRegistrations_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeCoreHandlerRegistrations, registrations_, id<GDJsonArray>)

@interface ComGoodowRealtimeCoreHandlerRegistrations_$1 : NSObject < GDJsonArray_ListIterator > {
}

- (void)callWithInt:(int)index
             withId:(id<ComGoodowRealtimeCoreHandlerRegistration>)value;

- (id)init;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeCoreHandlerRegistrations_$1_init() {}

@interface ComGoodowRealtimeCoreHandlerRegistrations_$2 : NSObject < ComGoodowRealtimeCoreHandlerRegistration > {
 @public
  ComGoodowRealtimeCoreHandlerRegistrations *this$0_;
  id<ComGoodowRealtimeCoreHandlerRegistration> val$registration_;
}

- (void)unregisterHandler;

- (id)initWithComGoodowRealtimeCoreHandlerRegistrations:(ComGoodowRealtimeCoreHandlerRegistrations *)outer$
           withComGoodowRealtimeCoreHandlerRegistration:(id<ComGoodowRealtimeCoreHandlerRegistration>)capture$0;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeCoreHandlerRegistrations_$2_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeCoreHandlerRegistrations_$2, this$0_, ComGoodowRealtimeCoreHandlerRegistrations *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeCoreHandlerRegistrations_$2, val$registration_, id<ComGoodowRealtimeCoreHandlerRegistration>)

#endif // _ComGoodowRealtimeCoreHandlerRegistrations_H_
