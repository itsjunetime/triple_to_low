%hook SBHomeHardwareButtonActions

@interface _CDBatterySaver
-(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
@end

-(void)performTriplePressUpActions {
	if ([[%c(NSProcessInfo) processInfo] isLowPowerModeEnabled]) {
		[[%c(_CDBatterySaver) batterySaver] setPowerMode:0 error:nil];
	} else {
		[[%c(_CDBatterySaver) batterySaver] setPowerMode:1 error:nil];
	}
}

%end
