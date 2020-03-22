#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray<NSNumber*>* fibonacci = [[NSMutableArray alloc] initWithArray:@[@0, @1] copyItems:YES];
    NSMutableArray<NSNumber*>* result = [NSMutableArray new];
    BOOL flag = YES;
    NSInteger index = 1;
    do {
        NSNumber *value = [[NSNumber alloc] initWithInt:([fibonacci[index] intValue] * [fibonacci[index-1] intValue])];
        if([number intValue] == [value intValue]){
            [result addObject:fibonacci[index-1]];
            [result addObject:fibonacci[index]];
            [result addObject: @1];
            return result;
        }
        if([number intValue] > [value intValue]){
            [fibonacci addObject:[[NSNumber alloc] initWithInt:([fibonacci[index] intValue] + [fibonacci[index-1] intValue])]];
            index++;
            continue;
        }
        if([number intValue] < [value intValue]){
            [result addObject:fibonacci[index-1]];
            [result addObject:fibonacci[index]];
            [result addObject: @0];
            return result;
        }
    } while (flag);
    return @[];
}
@end
