#import <Foundation/Foundation.h>
#import "GDCMessage.h"
#import "GDCBus.h"

static const NSString *topicKey = @"topic";
static const NSString *payloadKey = @"payload";
static const NSString *replyTopicKey = @"replyTopic";
static const NSString *localKey = @"local";
static const NSString *sendKey = @"send";
static const NSString *errorKey = @"error";
static const NSString *errorDomainKey = @"domain";
static const NSString *errorCodeKey = @"code";
static const NSString *errorUserInfoKey = @"userInfo";

@interface GDCMessageImpl : NSObject <GDCMessage>

@property(nonatomic, strong) NSString *topic;
@property(nonatomic, strong) id payload;
@property(nonatomic, strong) NSString *replyTopic;
@property(nonatomic) BOOL local;
@property(nonatomic) BOOL send;

@property(nonatomic, strong) id<GDCBus> bus;

+ (NSString *)generateReplyTopic;

- (NSDictionary *)toDictWithTopic:(BOOL)containsTopic;
@end