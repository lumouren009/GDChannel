//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/objc/ObjCNet.java
//

#include "J2ObjC_source.h"
#include "com/goodow/realtime/core/WebSocket.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "com/goodow/realtime/objc/ObjCNet.h"
#include "com/goodow/realtime/objc/ObjCWebSocket.h"

@implementation ComGoodowRealtimeObjcObjCNet

- (id<ComGoodowRealtimeCoreWebSocket>)createWebSocketWithNSString:(NSString *)url
                              withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options {
  return [[ComGoodowRealtimeObjcObjCWebSocket alloc] initWithNSString:url withComGoodowRealtimeJsonJsonObject:options];
}

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "createWebSocketWithNSString:withComGoodowRealtimeJsonJsonObject:", "createWebSocket", "Lcom.goodow.realtime.core.WebSocket;", 0x1, NULL },
    { "init", NULL, NULL, 0x0, NULL },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeObjcObjCNet = { 1, "ObjCNet", "com.goodow.realtime.objc", NULL, 0x0, 2, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeObjcObjCNet;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeObjcObjCNet)