#import "Tweak.h"

%hook SPTGaiaConnectAPIImplementation
- (void)discoverDevices {
    %orig;

    NSString *lastUsedId = [[NSUserDefaults standardUserDefaults] valueForKey:@"lastDeviceId"];
    
    for (SPTGaiaConnectDevice *device in self.devices) {
        if ([device.physicalDeviceId isEqualToString:lastUsedId] && device.isActive == NO) {
            NSLog(@"Logged activated lastDeviceId: %@", device.physicalDeviceId);
            [self activateDevice:device responseBlock:nil];

            NSLog(@"Logged preserved lastDeviceId: %@", lastUsedId);
            [[NSUserDefaults standardUserDefaults] setObject:lastUsedId forKey:@"lastDeviceId"];
            [[NSUserDefaults standardUserDefaults] synchronize];

        }

    }
}

- (void)activateDevice:(SPTGaiaConnectDevice *)arg1 responseBlock:(id)arg2 {
    %orig;

    NSString *deviceId = arg1.physicalDeviceId;
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"lastDeviceId"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    NSLog(@"Logged set lastDeviceId: %@", deviceId);
}

%end
