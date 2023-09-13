class ResID {
  ResID({
    required this.count,
    required this.data,
  });
  late final int count;
  late final List<Data> data;

  ResID.fromJson(Map<String, dynamic> json){
    count = json['count'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.aliasId,
    required this.messageIsFollower,
    required this.messageFollowerIds,
    required this.messagePartnerIds,
    required this.messageIds,
    required this.hasMessage,
    required this.messageUnread,
    required this.messageUnreadCounter,
    required this.messageNeedaction,
    required this.messageNeedactionCounter,
    required this.messageHasError,
    required this.messageHasErrorCounter,
    required this.messageAttachmentCount,
    required this.messageMainAttachmentId,
    required this.websiteMessageIds,
    required this.messageHasSmsError,
    required this.name,
    required this.active,
    required this.channelType,
    required this.isChat,
    required this.defaultDisplayMode,
    required this.description,
    required this.image_128,
    required this.avatar_128,
    required this.channelPartnerIds,
    required this.channelLastSeenPartnerIds,
    required this.rtcSessionIds,
    required this.isMember,
    required this.memberCount,
    required this.groupIds,
    required this.uuid,
    required this.public,
    required this.groupPublicId,
    required this.LastUpdate,
    required this.displayName,
    required this.createUid,
    required this.createDate,
    required this.writeUid,
    required this.writeDate,
    required this.subscriptionDepartmentIds,
    required this.aliasName,
    required this.aliasModelId,
    required this.aliasUserId,
    required this.aliasDefaults,
    required this.aliasForceThreadId,
    required this.aliasDomain,
    required this.aliasParentModelId,
    required this.aliasParentThreadId,
    required this.aliasContact,
    required this.aliasBouncedContent,
  });
  late final int id;
  late final List<num> aliasId;
  late final bool messageIsFollower;
  late final List<dynamic> messageFollowerIds;
  late final List<dynamic> messagePartnerIds;
  late final List<int> messageIds;
  late final bool hasMessage;
  late final bool messageUnread;
  late final int messageUnreadCounter;
  late final bool messageNeedaction;
  late final int messageNeedactionCounter;
  late final bool messageHasError;
  late final int messageHasErrorCounter;
  late final int messageAttachmentCount;
  late final bool messageMainAttachmentId;
  late final List<int> websiteMessageIds;
  late final bool messageHasSmsError;
  late final String name;
  late final bool active;
  late final String channelType;
  late final bool isChat;
  late final bool defaultDisplayMode;
  late final bool description;
  late final bool image_128;
  late final bool avatar_128;
  late final List<int> channelPartnerIds;
  late final List<int> channelLastSeenPartnerIds;
  late final List<dynamic> rtcSessionIds;
  late final bool isMember;
  late final int memberCount;
  late final List<dynamic> groupIds;
  late final String uuid;
  late final String public;
  late final List<num> groupPublicId;
  late final String LastUpdate;
  late final String displayName;
  late final List<num> createUid;
  late final String createDate;
  late final List<num> writeUid;
  late final String writeDate;
  late final List<dynamic> subscriptionDepartmentIds;
  late final bool aliasName;
  late final List<num> aliasModelId;
  late final List<num> aliasUserId;
  late final String aliasDefaults;
  late final int aliasForceThreadId;
  late final bool aliasDomain;
  late final List<num> aliasParentModelId;
  late final int aliasParentThreadId;
  late final String aliasContact;
  late final bool aliasBouncedContent;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    aliasId = List.castFrom<dynamic, num>(json['alias_id']);
    messageIsFollower = json['message_is_follower'];
    messageFollowerIds = List.castFrom<dynamic, dynamic>(json['message_follower_ids']);
    messagePartnerIds = List.castFrom<dynamic, dynamic>(json['message_partner_ids']);
    messageIds = List.castFrom<dynamic, int>(json['message_ids']);
    hasMessage = json['has_message'];
    messageUnread = json['message_unread'];
    messageUnreadCounter = json['message_unread_counter'];
    messageNeedaction = json['message_needaction'];
    messageNeedactionCounter = json['message_needaction_counter'];
    messageHasError = json['message_has_error'];
    messageHasErrorCounter = json['message_has_error_counter'];
    messageAttachmentCount = json['message_attachment_count'];
    messageMainAttachmentId = json['message_main_attachment_id'];
    websiteMessageIds = List.castFrom<dynamic, int>(json['website_message_ids']);
    messageHasSmsError = json['message_has_sms_error'];
    name = json['name'];
    active = json['active'];
    channelType = json['channel_type'];
    isChat = json['is_chat'];
    defaultDisplayMode = json['default_display_mode'];
    description = json['description'];
    image_128 = json['image_128'];
    avatar_128 = json['avatar_128'];
    channelPartnerIds = List.castFrom<dynamic, int>(json['channel_partner_ids']);
    channelLastSeenPartnerIds = List.castFrom<dynamic, int>(json['channel_last_seen_partner_ids']);
    rtcSessionIds = List.castFrom<dynamic, dynamic>(json['rtc_session_ids']);
    isMember = json['is_member'];
    memberCount = json['member_count'];
    groupIds = List.castFrom<dynamic, dynamic>(json['group_ids']);
    uuid = json['uuid'];
    public = json['public'];
    groupPublicId = List.castFrom<dynamic, num>(json['group_public_id']);
    LastUpdate = json['__last_update'];
    displayName = json['display_name'];
    createUid = List.castFrom<dynamic, num>(json['create_uid']);
    createDate = json['create_date'];
    writeUid = List.castFrom<dynamic, num>(json['write_uid']);
    writeDate = json['write_date'];
    subscriptionDepartmentIds = List.castFrom<dynamic, dynamic>(json['subscription_department_ids']);
    aliasName = json['alias_name'];
    aliasModelId = List.castFrom<dynamic, num>(json['alias_model_id']);
    aliasUserId = List.castFrom<dynamic, num>(json['alias_user_id']);
    aliasDefaults = json['alias_defaults'];
    aliasForceThreadId = json['alias_force_thread_id'];
    aliasDomain = json['alias_domain'];
    aliasParentModelId = List.castFrom<dynamic, num>(json['alias_parent_model_id']);
    aliasParentThreadId = json['alias_parent_thread_id'];
    aliasContact = json['alias_contact'];
    aliasBouncedContent = json['alias_bounced_content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['alias_id'] = aliasId;
    _data['message_is_follower'] = messageIsFollower;
    _data['message_follower_ids'] = messageFollowerIds;
    _data['message_partner_ids'] = messagePartnerIds;
    _data['message_ids'] = messageIds;
    _data['has_message'] = hasMessage;
    _data['message_unread'] = messageUnread;
    _data['message_unread_counter'] = messageUnreadCounter;
    _data['message_needaction'] = messageNeedaction;
    _data['message_needaction_counter'] = messageNeedactionCounter;
    _data['message_has_error'] = messageHasError;
    _data['message_has_error_counter'] = messageHasErrorCounter;
    _data['message_attachment_count'] = messageAttachmentCount;
    _data['message_main_attachment_id'] = messageMainAttachmentId;
    _data['website_message_ids'] = websiteMessageIds;
    _data['message_has_sms_error'] = messageHasSmsError;
    _data['name'] = name;
    _data['active'] = active;
    _data['channel_type'] = channelType;
    _data['is_chat'] = isChat;
    _data['default_display_mode'] = defaultDisplayMode;
    _data['description'] = description;
    _data['image_128'] = image_128;
    _data['avatar_128'] = avatar_128;
    _data['channel_partner_ids'] = channelPartnerIds;
    _data['channel_last_seen_partner_ids'] = channelLastSeenPartnerIds;
    _data['rtc_session_ids'] = rtcSessionIds;
    _data['is_member'] = isMember;
    _data['member_count'] = memberCount;
    _data['group_ids'] = groupIds;
    _data['uuid'] = uuid;
    _data['public'] = public;
    _data['group_public_id'] = groupPublicId;
    _data['__last_update'] = LastUpdate;
    _data['display_name'] = displayName;
    _data['create_uid'] = createUid;
    _data['create_date'] = createDate;
    _data['write_uid'] = writeUid;
    _data['write_date'] = writeDate;
    _data['subscription_department_ids'] = subscriptionDepartmentIds;
    _data['alias_name'] = aliasName;
    _data['alias_model_id'] = aliasModelId;
    _data['alias_user_id'] = aliasUserId;
    _data['alias_defaults'] = aliasDefaults;
    _data['alias_force_thread_id'] = aliasForceThreadId;
    _data['alias_domain'] = aliasDomain;
    _data['alias_parent_model_id'] = aliasParentModelId;
    _data['alias_parent_thread_id'] = aliasParentThreadId;
    _data['alias_contact'] = aliasContact;
    _data['alias_bounced_content'] = aliasBouncedContent;
    return _data;
  }
}