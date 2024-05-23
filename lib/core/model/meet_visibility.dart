enum MeetVisibility { all, closeFriends, friends }

String serializeToJson(MeetVisibility? visibility) {
  switch (visibility) {
    case (MeetVisibility.all):
      return "ALL";
    case (MeetVisibility.friends):
      return "FRIENDS";
    case (MeetVisibility.closeFriends):
      return "CLOSE_FRIENDS";
    case null:
      return "FRIENDS";
  }
}

MeetVisibility deserializeFromJson(String value) {
  switch (value) {
    case ("ALL"):
      return MeetVisibility.all;
    case ("FRIENDS"):
      return MeetVisibility.friends;
    case ("CLOSE_FRIENDS"):
      return MeetVisibility.closeFriends;
    default:
      throw ArgumentError("Meet visibility state doesn't exist");
  }
}


