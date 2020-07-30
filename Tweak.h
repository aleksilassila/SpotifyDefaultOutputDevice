@interface SPTGaiaConnectDevice : NSObject
@property(copy, nonatomic) NSString *physicalDeviceId;
@property(nonatomic) _Bool isActive;
@end

@interface SPTGaiaConnectAPIImplementation : NSObject
@property(readonly, nonatomic) NSArray *devices;
- (void)discoverDevices;
- (void)activateDevice:(SPTGaiaConnectDevice *)arg1 responseBlock:(id)arg2;
@end

