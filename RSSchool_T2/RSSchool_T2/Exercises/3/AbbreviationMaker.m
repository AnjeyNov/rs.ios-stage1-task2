#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    if([a length] == 0 || [b length] == 0) {
        return @"NO";
    }
    
    NSString *_a = [a lowercaseString];
    NSString *_b = [b lowercaseString];
    if([_a containsString:_b]){
        return @"YES";
    }
    
    NSString *symbolInFirstString;
    NSInteger index = 0;
    NSMutableString *trimmerString = [NSMutableString new];
    for(; index < [_a length]; index++){
        symbolInFirstString = [_a substringWithRange:NSMakeRange(index, 1)];
        if([_b containsString:symbolInFirstString]){
            [trimmerString appendString:symbolInFirstString];
        }
    }
    
    if([trimmerString containsString:_b]){
        return @"YES";
    }
    
    return @"NO";
}
@end
