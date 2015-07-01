//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/ReplyFailure.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "com/goodow/realtime/channel/ReplyFailure.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/IllegalStateException.h"

BOOL ComGoodowRealtimeChannelReplyFailureEnum_initialized = NO;

ComGoodowRealtimeChannelReplyFailureEnum *ComGoodowRealtimeChannelReplyFailureEnum_values_[3];

@implementation ComGoodowRealtimeChannelReplyFailureEnum

+ (ComGoodowRealtimeChannelReplyFailureEnum *)fromIntWithInt:(jint)i {
  return ComGoodowRealtimeChannelReplyFailureEnum_fromIntWithInt_(i);
}

- (jint)toInt {
  switch ([self ordinal]) {
    case ComGoodowRealtimeChannelReplyFailure_TIMEOUT:
    return 0;
    case ComGoodowRealtimeChannelReplyFailure_NO_HANDLERS:
    return 1;
    case ComGoodowRealtimeChannelReplyFailure_RECIPIENT_FAILURE:
    return 2;
    default:
    @throw [[JavaLangIllegalStateException alloc] initWithNSString:@"How did we get here?"];
  }
}

- (instancetype)initWithNSString:(NSString *)__name
                         withInt:(jint)__ordinal {
  return [super initWithNSString:__name withInt:__ordinal];
}

IOSObjectArray *ComGoodowRealtimeChannelReplyFailureEnum_values() {
  ComGoodowRealtimeChannelReplyFailureEnum_init();
  return [IOSObjectArray arrayWithObjects:ComGoodowRealtimeChannelReplyFailureEnum_values_ count:3 type:ComGoodowRealtimeChannelReplyFailureEnum_class_()];
}
+ (IOSObjectArray *)values {
  return ComGoodowRealtimeChannelReplyFailureEnum_values();
}

+ (ComGoodowRealtimeChannelReplyFailureEnum *)valueOfWithNSString:(NSString *)name {
  return ComGoodowRealtimeChannelReplyFailureEnum_valueOfWithNSString_(name);
}

ComGoodowRealtimeChannelReplyFailureEnum *ComGoodowRealtimeChannelReplyFailureEnum_valueOfWithNSString_(NSString *name) {
  ComGoodowRealtimeChannelReplyFailureEnum_init();
  for (int i = 0; i < 3; i++) {
    ComGoodowRealtimeChannelReplyFailureEnum *e = ComGoodowRealtimeChannelReplyFailureEnum_values_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelReplyFailureEnum class]) {
    ComGoodowRealtimeChannelReplyFailureEnum_TIMEOUT = [[ComGoodowRealtimeChannelReplyFailureEnum alloc] initWithNSString:@"TIMEOUT" withInt:0];
    ComGoodowRealtimeChannelReplyFailureEnum_NO_HANDLERS = [[ComGoodowRealtimeChannelReplyFailureEnum alloc] initWithNSString:@"NO_HANDLERS" withInt:1];
    ComGoodowRealtimeChannelReplyFailureEnum_RECIPIENT_FAILURE = [[ComGoodowRealtimeChannelReplyFailureEnum alloc] initWithNSString:@"RECIPIENT_FAILURE" withInt:2];
    J2OBJC_SET_INITIALIZED(ComGoodowRealtimeChannelReplyFailureEnum)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromIntWithInt:", "fromInt", "Lcom.goodow.realtime.channel.ReplyFailure;", 0x9, NULL },
    { "toInt", NULL, "I", 0x1, NULL },
    { "initWithNSString:withInt:", "init", NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "TIMEOUT", "TIMEOUT", 0x4019, "Lcom.goodow.realtime.channel.ReplyFailure;", &ComGoodowRealtimeChannelReplyFailureEnum_TIMEOUT,  },
    { "NO_HANDLERS", "NO_HANDLERS", 0x4019, "Lcom.goodow.realtime.channel.ReplyFailure;", &ComGoodowRealtimeChannelReplyFailureEnum_NO_HANDLERS,  },
    { "RECIPIENT_FAILURE", "RECIPIENT_FAILURE", 0x4019, "Lcom.goodow.realtime.channel.ReplyFailure;", &ComGoodowRealtimeChannelReplyFailureEnum_RECIPIENT_FAILURE,  },
  };
  static const char *superclass_type_args[] = {"Lcom.goodow.realtime.channel.ReplyFailure;"};
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelReplyFailureEnum = { 1, "ReplyFailure", "com.goodow.realtime.channel", NULL, 0x4011, 3, methods, 3, fields, 1, superclass_type_args};
  return &_ComGoodowRealtimeChannelReplyFailureEnum;
}

@end

ComGoodowRealtimeChannelReplyFailureEnum *ComGoodowRealtimeChannelReplyFailureEnum_fromIntWithInt_(jint i) {
  ComGoodowRealtimeChannelReplyFailureEnum_init();
  switch (i) {
    case 0:
    return ComGoodowRealtimeChannelReplyFailureEnum_TIMEOUT;
    case 1:
    return ComGoodowRealtimeChannelReplyFailureEnum_NO_HANDLERS;
    case 2:
    return ComGoodowRealtimeChannelReplyFailureEnum_RECIPIENT_FAILURE;
    default:
    @throw [[JavaLangIllegalStateException alloc] initWithNSString:JreStrcat("$I", @"Invalid index ", i)];
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelReplyFailureEnum)