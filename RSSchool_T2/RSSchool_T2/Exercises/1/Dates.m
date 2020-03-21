#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSMutableString *stringDate = [NSMutableString new];
    [stringDate appendString:year];
    [stringDate appendString:@"-"];
    [stringDate appendString:month];
    [stringDate appendString:@"-"];
    [stringDate appendString:day];
    [formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"GMT+00:00"]];
    NSDate *date = [formatter dateFromString:stringDate];
    formatter.dateFormat = @"d MMMM, EEEE";
    NSString *result = [formatter stringFromDate:date];
    if(result){
        return result;
    } else {
        return @"Такого дня не существует";
    }
}

@end
