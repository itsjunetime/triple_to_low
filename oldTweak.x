%hook SBHomeHardwareButtonActions

/*@interface _CDBatterySaver
-(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
@end

@interface IMServiceImpl
+ (id)serviceWithName:(id)arg1;
+ (id)allServices;
- (id)name;
- (id)localizedName;
- (id)internalName;
@end

@interface IMAccountController
+ (id)sharedInstance;
- (id)activeAccounts;
- (id)accounts;
- (id)operationalAccounts;
- (id)connectedAccounts;
@end

@interface IMAccount
- (id)serviceName;
@end

@interface IMHandle
- (id)initWithAccount:(id)arg1 ID:(id)arg2 alreadyCanonical:(bool)arg3;
@end

@interface IMChatRegistry
+ (id)sharedInstance;
- (id)chatForIMHandle:(id)arg1;
@end

@interface IMChat
- (void)sendMessage:(id)arg1;
@end

@interface IMMessage
- (id)initWithSender:(id)arg1 time:(id)arg2 text:(id)arg3 messageSubject:(id)arg4 fileTransferGUIDs:(id)arg5 flags:(unsigned long long)arg6 error:(id)arg7 guid:(id)arg8 subject:(id)arg9;
@end

@interface CKConversationList
+ (id)sharedConversationList;
- (id)conversationForExistingChat:(id)arg1;
- (id)conversationForExistingChatWithGUID:(id)arg1;
- (id)conversationForExistingChatWithGroupID:(id)arg1;
- (id)conversationForExistingChatWithIMChatGroupID:(id)arg1;
- (id)conversationForExistingChatWithIMChatPersonCentricID:(id)arg1;
@end

@interface CKConversation
- (id)messageWithComposition:(id)arg1;
- (void)sendMessage:(id)arg1 newComposition:(bool)arg2;
@end

@interface CKComposition
- (id)initWithText:(id)arg1 subject:(id)arg2;
@end

@interface CKMessage
@end

@interface CTMessageCenter
+ (id)sharedMessageCenter;
- (void)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3;
@end*/

-(void)performTriplePressUpActions {
	if ([[%c(NSProcessInfo) processInfo] isLowPowerModeEnabled]) {
		[[%c(_CDBatterySaver) batterySaver] setPowerMode:0 error:nil];
	} else {
		[[%c(_CDBatterySaver) batterySaver] setPowerMode:1 error:nil];
	}

	/// NEW METHOD TRYING HERE ***************

	//[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.MobileSMS" suspended:YES];

	NSString* recipient = @"+15203106053";
	NSString* recipientplus = @"15203106053";
	NSString* recipientbasic = @"5203106053";

	CKConversationList* conversationList = [%c(CKConversationList) sharedConversationList];
	CKConversation *conversation = [conversationList conversationForExistingChatWithGroupID:recipient];

	NSLog(@"NLGF: list: %@", conversationList);

	NSLog(@"NLGF: Conversation reg: %@", conversation);
	NSLog(@"NLGF: Conversation wo plus: %@", [conversationList conversationForExistingChatWithGroupID:recipientplus]);
	NSLog(@"NLGF: Conversation basic: %@", [conversationList conversationForExistingChatWithGroupID:recipientbasic]);
	NSLog(@"NLGF: conversation existing chat with guid: %@", [conversationList conversationForExistingChatWithGUID:recipient]);
	NSLog(@"NLGF: conversation existing chat with guid wo plus: %@", [conversationList conversationForExistingChatWithGUID:recipientplus]);
	NSLog(@"NLGF: conversation existing chat with guid basic: %@", [conversationList conversationForExistingChatWithGUID:recipientbasic]);

	NSLog(@"NLGF: conversation existing chat with im chat group id: %@", [conversationList conversationForExistingChatWithIMChatGroupID:recipient]);
	NSLog(@"NLGF: conversation existing chat with im chat group id wo plus: %@", [conversationList conversationForExistingChatWithIMChatGroupID:recipientplus]);
	NSLog(@"NLGF: conversation existing chat with im chat group id basic: %@", [conversationList conversationForExistingChatWithIMChatGroupID:recipientbasic]);
	NSLog(@"NLGF: conversation existing chat with im chat person centric id: %@", [conversationList conversationForExistingChatWithIMChatPersonCentricID:recipient]);


	NSAttributedString* text = [[NSAttributedString alloc] initWithString: [NSString stringWithFormat:@"This is a test message."]];
	CKComposition* composition = [[%c(CKComposition) alloc] initWithText:text subject:nil];

	NSLog(@"NLGF: composition: %@", composition);

	NSLog(@"NLGF: class of thing is %@", [[conversation messageWithComposition:composition] class]);

	[conversation sendMessage:composition newComposition:YES];

	/// END OF NEW METHOD ********************
	
	[[%c(CTMessageCenter) sharedMessageCenter] sendSMSWithText:@"This is a test message! Let me know if you get it." serviceCenter:nil toAddress:@"15203106053"];

	NSString *message = @"This is a test message! Sorry if you didn't expect to receive it, just let me know :)";
	NSString *to = @"+15203106052";
	//NSString *from = @"+15202621123";

	id service = [%c(IMServiceImpl) serviceWithName:@"SMS"];
	IMAccountController *accountController = [%c(IMAccountController) sharedInstance];

	/// Just checkin values
	NSLog(@"NLGF $IMServiceImpl = %@", [$IMServiceImpl serviceWithName:@"SMS"]);
	NSLog(@"NLGF accountController = %@", accountController);
	
	//NSLog(@"NLGF _accounts = %@", [accountController _accounts]);
	NSLog(@"NLGF accounts = %@", [accountController accounts]);
	NSLog(@"NLGF operationalAccounts = %@", [accountController operationalAccounts]);
	NSLog(@"NLGF connectedAccounts = %@", [accountController connectedAccounts]);
	NSLog(@"NLGF activeAccounts = %@", [accountController activeAccounts]);
	//NSLog(@"NLGF numberOfAccounts = %d", [accountController numberOfAccounts]);

	IMAccount *smsAccount = nil;
	BOOL foundAccount = NO;
	for (IMAccount *account in [accountController activeAccounts]) {
		if ([[account serviceName] isEqualToString:@"SMS"]) {
			foundAccount = YES;
			smsAccount = account;
			break;
		}
		if ([[account serviceName] isEqualToString:@"iMessage"]) {
			foundAccount = YES;
			smsAccount = account;
			break;
		}
		NSLog(@"NLGF account name = %@", [account serviceName]);
	}

	for (IMServiceImpl *serv in [%c(IMServiceImpl) allServices]) {
		NSLog(@"NLGF service name = %@", [serv name]);
		NSLog(@"NLGF service localized name = %@", [serv localizedName]);
		NSLog(@"NLGF internal name = %@", [serv internalName]);
	}

	if (foundAccount == NO) {
		NSLog(@"NLGF was not able to find account :(");
	}

	NSLog(@"NLGF smsAccount = %@", smsAccount);

	IMHandle *smsHandle = [[%c(IMHandle) alloc] initWithAccount:smsAccount ID:from alreadyCanonical:YES];
	NSLog(@"NLGF smshandle = %@", smsHandle);

	IMChatRegistry *chatRegistry = [%c(IMChatRegistry) sharedInstance];
	IMChat *chat = [chatRegistry chatForIMHandle:smsHandle];

	NSLog(@"NLGF chatRegistry = %@", chatRegistry);
	NSLog(@"NLGF chat = %@", chat);

	NSConcreteMutableAttributedString *messageText = [[%c(NSConcreteMutableAttributedString) alloc] initWithString:message];
	NSLog(@"NLGF messageText = %@", messageText);

	NSConcreteMutableAttributedString *messageSubject = [[%c(NSConcreteMutableAttributedString) alloc] initWithString:@""];
	NSLog(@"NLGF messageSubject = %@", messageSubject);

	IMMessage *smsMessage = [[%c(IMMessage) alloc] initWithSender:smsHandle time:[NSDate date] text:messageText messageSubject:messageSubject fileTransferGUIDs:[NSArray array] flags:5 error:nil guid:nil subject:nil];
	NSLog(@"NLGF smsMessage = %@", smsMessage);	

	[chat sendMessage:smsMessage];
}

%end

%hook CKMessageEntryView

- (void)touchUpInsideSendButton:(id)arg1 {
	NSLog(@"Touched button");
	NSLog(@"NLGF class = %@", [arg1 class]);
	%orig;
}

%end

%hook CTMessageCenter

- (void) acknowledgeOutgoingMessageWithId:(unsigned int)arg1 {
	NSLog(@"NLGF outgoing message: %u", arg1);
	%orig;
}

%end

%hook CTMessage

- (void)addContentTypeParameterWithName:(id)arg1 value:(id)arg2 {
	NSLog(@"NLGF: Called addContentTypeParameterWithName in CTMessage");
	%orig;
}

- (id)addData:(id)arg1 withContentType:(id)arg2 {
	NSLog(@"NLGF: Called addData in CTMessage");
	return %orig;
}

- (void)addEmailRecipient:(id)arg1 {
	NSLog(@"NLGF: Called addEmailRecipient in CTMessage");
	%orig;
}

- (id)addPart:(id)arg1 {
	NSLog(@"NLGF: Called addPart in CTMessage");
	return %orig;
}

- (void)addPhoneRecipient:(id)arg1 {
	NSLog(@"NLGF: Called addPhoneRecipient in CTMessage");
	%orig;
}

- (void)addRecipient:(id)arg1 {
	NSLog(@"NLGF: Called addRecipient in CTMessage");
	%orig;
}

- (id)addText:(id)arg1 {
	NSLog(@"NLGF: Called addText in CTMessage");
	return %orig;
}

- (id)allContentTypeParameterNames {
	NSLog(@"NLGF: Called allContentTypeParameterNames in CTMessage");
	return %orig;
}

- (bool)bypassSupportedMessageModesCheck {
	NSLog(@"NLGF: Called bypassSupportedMessageModesCheck in CTMessage");
	return %orig;
}

- (id)contentType {
	NSLog(@"NLGF: Called contentType in CTMessage");
	return %orig;
}

- (id)contentTypeParameterWithName:(id)arg1 {
	NSLog(@"NLGF: Called contentTypeParameterWithName in CTMessage");
	return %orig;
}

- (id)context {
	NSLog(@"NLGF: Called context in CTMessage");
	return %orig;
}

- (id)countryCode {
	NSLog(@"NLGF: Called countryCode in CTMessage");
	return %orig;
}

- (id)date {
	NSLog(@"NLGF: Called date in CTMessage");
	return %orig;
}

- (void)dealloc {
	NSLog(@"NLGF: Called dealloc in CTMessage");
	%orig;
}

- (id)description {
	NSLog(@"NLGF: Called description in CTMessage");
	return %orig;
}

- (id)init {
	NSLog(@"NLGF: Called init in CTMessage");
	return %orig;
}

- (id)initWithDate:(id)arg1 {
	NSLog(@"NLGF: Called initWithDate in CTMessage");
	return %orig;
}

- (id)items {
	NSLog(@"NLGF: Called items in CTMessage");
	return %orig;
}

- (unsigned int)messageId {
	NSLog(@"NLGF: Called messageId in CTMessage");
	return %orig;
}

- (int)messageType {
	NSLog(@"NLGF: Called messageType in CTMessage");
	return %orig;
}

- (id)rawHeaders {
	NSLog(@"NLGF: Called rawHeaders in CTMessage");
	return %orig;
}

- (id)recipients {
	NSLog(@"NLGF: Called recipients in CTMessage");
	return %orig;
}

- (void)removePartAtIndex:(unsigned long long)arg1 {
	NSLog(@"NLGF: Called removePartAtIndex in CTMessage");
	%orig;
}

- (void)removeRecipient:(id)arg1 {
	NSLog(@"NLGF: Called removeRecipient in CTMessage");
	%orig;
}

- (void)removeRecipientsInArray:(id)arg1 {
	NSLog(@"NLGF: Called removeRecipientsInArray in CTMessage");
	%orig;
}

- (unsigned int)replaceMessage {
	NSLog(@"NLGF: Called replaceMessage in CTMessage");
	return %orig;
}

- (id)sender {
	NSLog(@"NLGF: Called sender in CTMessage");
	return %orig;
}

- (id)serviceCenter {
	NSLog(@"NLGF: Called serviceCenter in CTMessage");
	return %orig;
}

- (void)setBypassSupportedMessageModesCheck:(bool)arg1 {
	NSLog(@"NLGF: Called setBypassSupportedMessageModesCheck in CTMessage");
	%orig;
}

- (void)setContentType:(id)arg1 {
	NSLog(@"NLGF: Called setContentType in CTMessage");
	%orig;
}

- (void)setContext:(id)arg1 {
	NSLog(@"NLGF: Called setContext in CTMessage");
	%orig;
}

- (void)setCountryCode:(id)arg1 {
	NSLog(@"NLGF: Called setCountryCode in CTMessage");
	%orig;
}

- (void)setMessageId:(unsigned int)arg1 {
	NSLog(@"NLGF: Called setMessageId in CTMessage");
	%orig;
}

- (void)setMessageType:(int)arg1 {
	NSLog(@"NLGF: Called setMessageType in CTMessage");
	%orig;
}

- (void)setRawHeaders:(id)arg1 {
	NSLog(@"NLGF: Called setRawHeaders in CTMessage");
	%orig;
}

- (void)setRecipient:(id)arg1 {
	NSLog(@"NLGF: Called setRecipient in CTMessage");
	%orig;
}

- (void)setRecipients:(id)arg1 {
	NSLog(@"NLGF: Called setRecipients in CTMessage");
	%orig;
}

- (void)setReplaceMessage:(unsigned int)arg1 {
	NSLog(@"NLGF: Called setReplaceMessage in CTMessage");
	%orig;
}

- (void)setSender:(id)arg1 {
	NSLog(@"NLGF: Called setSender in CTMessage");
	%orig;
}

- (void)setServiceCenter:(id)arg1 {
	NSLog(@"NLGF: Called setServiceCenter in CTMessage");
	%orig;
}

- (void)setSubject:(id)arg1 {
	NSLog(@"NLGF: Called setSubject in CTMessage");
	%orig;
}

- (void)setUniqueIdentifier:(id)arg1 {
	NSLog(@"NLGF: Called setUniqueIdentifier in CTMessage");
	%orig;
}

- (id)subject {
	NSLog(@"NLGF: Called subject in CTMessage");
	return %orig;
}

- (id)uniqueIdentifier {
	NSLog(@"NLGF: Called uniqueIdentifier in CTMessage");
	return %orig;
}

%end



%hook CTMessageCenter

+ (id)sharedMessageCenter {
	NSLog(@"NLGF: Called sharedMessageCenter in CTMessageCenter");
	return %orig;
}

- (void)acknowledgeIncomingMessageWithId:(unsigned int)arg1 {
	NSLog(@"NLGF: Called acknowledgeIncomingMessageWithId in CTMessageCenter");
	%orig;
}

- (void)acknowledgeOutgoingMessageWithId:(unsigned int)arg1 {
	NSLog(@"NLGF: Called acknowledgeOutgoingMessageWithId in CTMessageCenter");
	%orig;
}

- (void)addMessageOfType:(int)arg1 toArray:(id)arg2 withIdsFromArray:(id)arg3 {
	NSLog(@"NLGF: Called addMessageOfType in CTMessageCenter");
	%orig;
}

- (id)allIncomingMessages {
	NSLog(@"NLGF: Called allIncomingMessages in CTMessageCenter");
	return %orig;
}

- (void)dealloc {
	NSLog(@"NLGF: Called dealloc in CTMessageCenter");
	%orig;
}

- (id)decodeMessage:(id)arg1 {
	NSLog(@"NLGF: Called decodeMessage in CTMessageCenter");
	return %orig;
}

- (id)deferredMessageWithId:(unsigned int)arg1 {
	NSLog(@"NLGF: Called deferredMessageWithId in CTMessageCenter");
	return %orig;
}

- (id)encodeMessage:(id)arg1 {
	NSLog(@"NLGF: Called encodeMessage in CTMessageCenter");
	return %orig;
}

- (bool)getCharacterCount:(long long*)arg1 andMessageSplitThreshold:(long long*)arg2 forSmsText:(id)arg3 {
	NSLog(@"NLGF: Called getCharacterCount in CTMessageCenter");
	return %orig;
}

- (bool)getCharacterCountForSub:(id)arg1 count:(long long*)arg2 andMessageSplitThreshold:(long long*)arg3 forSmsText:(id)arg4 {
	NSLog(@"NLGF: Called getCharacterCountForSub in CTMessageCenter");
	return %orig;
}

- (int)incomingMessageCount {
	NSLog(@"NLGF: Called incomingMessageCount in CTMessageCenter");
	return %orig;
}

- (id)incomingMessageWithId:(unsigned int)arg1 {
	NSLog(@"NLGF: Called incomingMessageWithId in CTMessageCenter");
	return %orig;
}

- (id)incomingMessageWithId:(unsigned int)arg1 isDeferred:(bool)arg2 {
	NSLog(@"NLGF: Called incomingMessageWithId in CTMessageCenter");
	return %orig;
}

- (id)init {
	NSLog(@"NLGF: Called init in CTMessageCenter");
	return %orig;
}

- (struct { int x1 { int x2; })isDeliveryReportsEnabled:(bool*)arg1;
	NSLog(@"NLGF: Called isDeliveryReportsEnabled in CTMessageCenter");
	return %orig;
}

- (bool)isMmsConfigured {
	NSLog(@"NLGF: Called isMmsConfigured in CTMessageCenter");
	return %orig;
}

- (bool)isMmsConfiguredForSub:(id)arg1 {
	NSLog(@"NLGF: Called isMmsConfiguredForSub in CTMessageCenter");
	return %orig;
}

- (bool)isMmsEnabled {
	NSLog(@"NLGF: Called isMmsEnabled in CTMessageCenter");
	return %orig;
}

- (bool)isMmsEnabledForSub:(id)arg1 {
	NSLog(@"NLGF: Called isMmsEnabledForSub in CTMessageCenter");
	return %orig;
}

- (struct { int x1 { int x2; })send:(id)arg1;
	NSLog(@"NLGF: Called send in CTMessageCenter");
	return %orig;
}

- (struct { int x1 { int x2; })send:(id)arg1 withMoreToFollow:(bool)arg2;
	NSLog(@"NLGF: Called send in CTMessageCenter");
	return %orig;
}

- (bool)sendBinarySMS:(id)arg1 trackingID:(unsigned int*)arg2 {
	NSLog(@"NLGF: Called sendBinarySMS in CTMessageCenter");
	return %orig;
}

- (struct { int x1 { int x2; })sendMMS:(id)arg1;
	NSLog(@"NLGF: Called sendMMS in CTMessageCenter");
	return %orig;
}

- (struct { int x1 { int x2; })sendMMSFromData:(id)arg1 messageId:(unsigned int)arg2 subSlot:(long long)arg3;
	NSLog(@"NLGF: Called sendMMSFromData in CTMessageCenter");
	return %orig;
}

- (void)sendMessageAsSmsToShortCodeRecipients:(id)arg1 andReplaceData:(id*)arg2 {
	NSLog(@"NLGF: Called sendMessageAsSmsToShortCodeRecipients in CTMessageCenter");
	%orig;
}

- (struct { int x1 { int x2; })sendSMS:(id)arg1 withMoreToFollow:(bool)arg2 trackingID:(unsigned int*)arg3;
	NSLog(@"NLGF: Called sendSMS in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3 trackingID:(unsigned int*)arg4 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3 withID:(unsigned int)arg4 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3 withMoreToFollow:(bool)arg4 withID:(unsigned int)arg5 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 text:(id)arg2 serviceCenter:(id)arg3 toAddress:(id)arg4 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 text:(id)arg2 serviceCenter:(id)arg3 toAddress:(id)arg4 trackingID:(unsigned int*)arg5 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 text:(id)arg2 serviceCenter:(id)arg3 toAddress:(id)arg4 withID:(unsigned int)arg5 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (bool)sendSMSWithText:(id)arg1 text:(id)arg2 serviceCenter:(id)arg3 toAddress:(id)arg4 withMoreToFollow:(bool)arg5 withID:(unsigned int)arg6 {
	NSLog(@"NLGF: Called sendSMSWithText in CTMessageCenter");
	return %orig;
}

- (void)setDeliveryReportsEnabled:(bool)arg1 {
	NSLog(@"NLGF: Called setDeliveryReportsEnabled in CTMessageCenter");
	%orig;
}

- (bool)simulateDeferredMessage {
	NSLog(@"NLGF: Called simulateDeferredMessage in CTMessageCenter");
	return %orig;
}

- (bool)simulateSmsReceived:(id)arg1 {
	NSLog(@"NLGF: Called simulateSmsReceived in CTMessageCenter");
	return %orig;
}

- (id)statusOfOutgoingMessages {
	NSLog(@"NLGF: Called statusOfOutgoingMessages in CTMessageCenter");
	return %orig;
}

%end
