#import "Blocks.h"

@implementation Blocks

-(id)init {
    self = [super init];
    
    if(self) {
        __weak Blocks* weekSelf = self;
        
        self.blockA = ^(NSArray *arr) {
            __strong Blocks *strongSelf = weekSelf;
            strongSelf->array = [[NSArray alloc] initWithArray:arr copyItems:YES];
        };
        
        self.blockB = ^(Class class) {
            __strong Blocks* strongSelf = weekSelf;
            
            if([NSString class] == class) {
                NSMutableString *resultString = [NSMutableString new];
                for(NSObject *value in strongSelf->array) {
                    if([value isKindOfClass:class]) {
                        [resultString appendString:value];
                    }
                }
                strongSelf.blockC(resultString);
            }
            
            if([NSNumber class] == class) {
                NSInteger sum = 0;
                for(id value in strongSelf->array) {
                    if([value isKindOfClass:class]) {
                        sum += [value intValue];
                    }
                }
                strongSelf.blockC([[NSNumber alloc] initWithInt:(int)sum]);
            }
            
            if([NSDate class] == class) {
                NSDate *result = nil;
                for(id value in strongSelf->array) {
                    if([value isKindOfClass:class]) {
                        if(result == nil){
                            result = [value copy];
                            continue;
                        }
                        if([value compare:result] == NSOrderedDescending) {
                            result = [value copy];
                        }
                    }
                }
                NSDateFormatter *formatter = [NSDateFormatter new];
                formatter.dateFormat = @"dd.MM.yyyy";
                strongSelf.blockC([formatter stringFromDate:result]);
            }
        };
    }
    
    return self;
}

@end

