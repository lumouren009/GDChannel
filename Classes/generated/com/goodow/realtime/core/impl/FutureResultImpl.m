//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/core/impl/FutureResultImpl.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/impl/FutureResultImpl.h"
#include "java/lang/Throwable.h"

__attribute__((unused)) static void ComGoodowRealtimeCoreImplFutureResultImpl_checkCallHandler(ComGoodowRealtimeCoreImplFutureResultImpl *self);

@interface ComGoodowRealtimeCoreImplFutureResultImpl () {
 @public
  jboolean failed__;
  jboolean succeeded__;
  id<ComGoodowRealtimeCoreHandler> handler_;
  id result__;
  JavaLangThrowable *throwable_;
}

- (void)checkCallHandler;
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeCoreImplFutureResultImpl, handler_, id<ComGoodowRealtimeCoreHandler>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeCoreImplFutureResultImpl, result__, id)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeCoreImplFutureResultImpl, throwable_, JavaLangThrowable *)

@implementation ComGoodowRealtimeCoreImplFutureResultImpl

- (instancetype)init {
  return [super init];
}

- (instancetype)initWithId:(id)result {
  if (self = [super init]) {
    (void) [self setResultWithId:result];
  }
  return self;
}

- (instancetype)initWithJavaLangThrowable:(JavaLangThrowable *)t {
  if (self = [super init]) {
    if (t == nil) {
      (void) [self setResultWithId:nil];
    }
    else {
      (void) [self setFailureWithJavaLangThrowable:t];
    }
  }
  return self;
}

- (JavaLangThrowable *)cause {
  return throwable_;
}

- (jboolean)complete {
  return failed__ || succeeded__;
}

- (jboolean)failed {
  return failed__;
}

- (id)result {
  return result__;
}

- (ComGoodowRealtimeCoreImplFutureResultImpl *)setFailureWithJavaLangThrowable:(JavaLangThrowable *)throwable {
  self->throwable_ = throwable;
  failed__ = YES;
  ComGoodowRealtimeCoreImplFutureResultImpl_checkCallHandler(self);
  return self;
}

- (ComGoodowRealtimeCoreImplFutureResultImpl *)setHandlerWithComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  self->handler_ = handler;
  ComGoodowRealtimeCoreImplFutureResultImpl_checkCallHandler(self);
  return self;
}

- (ComGoodowRealtimeCoreImplFutureResultImpl *)setResultWithId:(id)result {
  self->result__ = result;
  succeeded__ = YES;
  ComGoodowRealtimeCoreImplFutureResultImpl_checkCallHandler(self);
  return self;
}

- (jboolean)succeeded {
  return succeeded__;
}

- (void)checkCallHandler {
  ComGoodowRealtimeCoreImplFutureResultImpl_checkCallHandler(self);
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeCoreImplFutureResultImpl *)other {
  [super copyAllFieldsTo:other];
  other->failed__ = failed__;
  other->succeeded__ = succeeded__;
  other->handler_ = handler_;
  other->result__ = result__;
  other->throwable_ = throwable_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", "FutureResultImpl", NULL, 0x1, NULL },
    { "initWithId:", "FutureResultImpl", NULL, 0x1, NULL },
    { "initWithJavaLangThrowable:", "FutureResultImpl", NULL, 0x1, NULL },
    { "cause", NULL, "Ljava.lang.Throwable;", 0x1, NULL },
    { "complete", NULL, "Z", 0x1, NULL },
    { "failed", NULL, "Z", 0x1, NULL },
    { "result", NULL, "TT;", 0x1, NULL },
    { "setFailureWithJavaLangThrowable:", "setFailure", "Lcom.goodow.realtime.core.impl.FutureResultImpl;", 0x1, NULL },
    { "setHandlerWithComGoodowRealtimeCoreHandler:", "setHandler", "Lcom.goodow.realtime.core.impl.FutureResultImpl;", 0x1, NULL },
    { "setResultWithId:", "setResult", "Lcom.goodow.realtime.core.impl.FutureResultImpl;", 0x1, NULL },
    { "succeeded", NULL, "Z", 0x1, NULL },
    { "checkCallHandler", NULL, "V", 0x2, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "failed__", "failed", 0x2, "Z", NULL,  },
    { "succeeded__", "succeeded", 0x2, "Z", NULL,  },
    { "handler_", NULL, 0x2, "Lcom.goodow.realtime.core.Handler;", NULL,  },
    { "result__", "result", 0x2, "TT;", NULL,  },
    { "throwable_", NULL, 0x2, "Ljava.lang.Throwable;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeCoreImplFutureResultImpl = { 1, "FutureResultImpl", "com.goodow.realtime.core.impl", NULL, 0x1, 12, methods, 5, fields, 0, NULL};
  return &_ComGoodowRealtimeCoreImplFutureResultImpl;
}

@end

void ComGoodowRealtimeCoreImplFutureResultImpl_checkCallHandler(ComGoodowRealtimeCoreImplFutureResultImpl *self) {
  if (self->handler_ != nil && [self complete]) {
    [self->handler_ handleWithId:self];
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeCoreImplFutureResultImpl)