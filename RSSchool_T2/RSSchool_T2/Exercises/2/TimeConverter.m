#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function

- (id)init {
    self = [super init];
    if(self) {
        nums = @[ @"zero", @"one", @"two", @"three", @"four",
        @"five", @"six", @"seven", @"eight", @"nine",
        @"ten", @"eleven", @"twelve", @"thirteen",
        @"fourteen", @"fifteen", @"sixteen", @"seventeen",
        @"eighteen", @"nineteen", @"twenty", @"twenty one",
        @"twenty two", @"twenty three", @"twenty four",
        @"twenty five", @"twenty six", @"twenty seven",
        @"twenty eight", @"twenty nine"];
    }
    return self;
}

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSMutableString *result = [[NSMutableString alloc] init];
    NSInteger _hours = [hours intValue];
    NSInteger _minutes = [minutes intValue];
    
    if(!(0 <= _hours && _hours < 24) || !(0 <= _minutes && _minutes < 60)) {
        return @"";
    }
    
    if(_minutes == 0) {
        [result appendString:nums[_hours]];
        [result appendString:@" o' clock"];
        return result;
    }
    if(_minutes == 15) {
        [result appendString:@"quarter past "];
        [result appendString:nums[_hours]];
        return result;
    }
    if(_minutes == 45) {
        [result appendString:@"quarter to "];
        [result appendString:nums[_hours+1]];
        return result;
    }
    if(_minutes == 30) {
        [result appendString:@"half past "];
        [result appendString:nums[_hours]];
        return result;
    }
    if(_minutes < 30) {
        [result appendString:nums[_minutes]];
        [result appendString:@" minutes past "];
        [result appendString:nums[_hours]];
        return result;
    }
    if(_minutes > 30) {
        [result appendString:nums[60 - _minutes]];
        [result appendString:@" minutes to "];
        [result appendString:nums[_hours+1]];
        return result;
    }
    return @"";
}
@end
