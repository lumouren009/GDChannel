#import <Foundation/Foundation.h>
#import "GDCBus.h"

@interface GDCMqttBus : NSObject <GDCBus>

- (instancetype)initWithHost:(NSString *)host;

@end