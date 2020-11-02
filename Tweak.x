@interface BCUIRingItemView : UIView
@end

@interface _CDBatterySaver : NSObject
+(id)sharedInstance;
-(long long)getPowerMode;
-(BOOL)setPowerMode:(long long)arg1 error:(id*)arg2 ;
@end

%hook BCUIRingItemView
-(id)init {
	%orig;
	UITapGestureRecognizer *singleFingerTap = 
  	[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[self addGestureRecognizer:singleFingerTap];
	return self;
}

%new
-(void)handleTap:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
		long long newPowerMode = [[NSProcessInfo processInfo] isLowPowerModeEnabled] ? 0 : 1;
		[[%c(_CDBatterySaver) sharedInstance] setPowerMode:newPowerMode error:nil];
    }
}
%end
