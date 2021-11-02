enum ChannelType {
  none,
  news,
  groupChat,
  forum,
}

var channelTypeString = {
  ChannelType.none: 'None',
  ChannelType.news: 'News',
  ChannelType.groupChat: 'Group chat',
  ChannelType.forum: 'Forum',
};

var channelTypeByOrder = [
  ChannelType.none,
  ChannelType.news,
  ChannelType.groupChat,
  ChannelType.forum
];