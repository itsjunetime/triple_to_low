%hook SBHomeHardwareButtonActions

@interface FBSceneManager
+ (id)sharedInstance;
- (id)sceneWithIdentifier:(id)arg1;
@end

@interface FBSceneClientProvider
@end

@interface FBScene
@property(readonly, nonatomic) id <FBSceneClientProvider> clientProvider;
@property(readonly, nonatomic) id <FBSceneClient> client;
@property(readonly, nonatomic) FBSSceneSettings *settings;
@end

@interface FBSSceneSettings
@property(nonatomic, getter=isBackgrounded, setter=setBackgrounded) _Bool backgrounded;
@end

@interface FBSSceneSettingsDiff
+ (id)diffFromSettings:(id)arg1 toSettings:(id)arg2;
@end

-(void)performTriplePressUpActions {

	[[%c("UIApplication") sharedApplication] launchApplicationWithIdentifier:@"Ian-Welker.SMServer" suspended:YES];

	FBScene *scene = [[%c("FBSceneManager") sharedInstance] sceneWithIdentifier:@"Ian-Welker.SMServer"];
	NSObject <FBSceneClientProvider> *clientProvider = [scene clientProvider];
	NSObject <FBSceneClient> *sceneClient = [scene client];
	FBSSceneSettings *sceneSettings = [[scene settings] mutableCopy];
	[sceneSettings setBackgrounded:NO];
	FBSSceneSettingsDiff *sceneSettingsDiff = [%c("FBSSceneSettingsDiff") diffFromSettings:[scene settings] toSettings:sceneSettings];
	[clientProvider beginTransaction];
	[sceneClient host:scene didUpdateSettings:sceneSettings withDiff:sceneSettingsDiff transitionContext:0 completion:nil];
	[clientProvider endTransaction];

}

%end
