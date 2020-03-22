#import <Foundation/Foundation.h>

@interface TimeConverter : NSObject{
    NSArray<NSString*> *nums;
}

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes;
@end
