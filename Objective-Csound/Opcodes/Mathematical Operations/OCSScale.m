//
//  OCSScale.m
//
//  Created by Aurelius Prochazka on 7/1/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSScale.h"  

@interface OCSScale () {
    OCSControlParam *kscl;
    OCSControlParam *kin;
    OCSControlParam *kmax;
    OCSControlParam *kmin;
}
@end

@implementation OCSScale

@synthesize output        = kscl;
@synthesize input         = kin;
@synthesize minimumOutput = kmin;
@synthesize maximumOutput = kmax;

- (id)initWithInput:(OCSControlParam *)input
      minimumOutput:(OCSControlParam *)minimumOutput
      maximumOutput:(OCSControlParam *)maximumOutput;
{
    self = [super init];
    
    if (self) {
        kscl = [OCSControlParam paramWithString:[self opcodeName]];      
        kin  = input;
        kmax = maximumOutput;
        kmin = minimumOutput;
    }
    return self; 
}

/// CSD Representation: kscl scale kinput, kmax, kmin
- (NSString *)stringForCSD 
{
    return [NSString stringWithFormat:@"%@ scale %@, %@, %@", kscl, kin, kmax, kmin];
}

/// Gives the CSD string for the output parameter.  
- (NSString *)description {
    return [kscl parameterString];
}

@end
