//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/Message.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeChannelMessage_H_
#define _ComGoodowRealtimeChannelMessage_H_

@protocol ComGoodowRealtimeCoreHandler;

#import "JreEmulation.h"

@protocol ComGoodowRealtimeChannelMessage < NSObject, JavaObject >

- (NSString *)address;

- (id)body;

- (void)failWithInt:(int)failureCode
       withNSString:(NSString *)msg;

- (void)replyWithId:(id)msg
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (NSString *)replyAddress;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelMessage_init() {}

#endif // _ComGoodowRealtimeChannelMessage_H_
