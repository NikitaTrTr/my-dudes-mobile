import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/core/model/data/user.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';

import 'participant.dart';

class ParticipantsList extends StatefulWidget {
  final List<String> userIds;
  final ScrollController scrollController;

  ParticipantsList(this.userIds, this.scrollController);

  @override
  _ParticipantsListState createState() => _ParticipantsListState();
}

class _ParticipantsListState extends State<ParticipantsList> {
  final MeetController _meetController = Get.find();

  final Map<String, Future<User>> _futureCache = {};
  final Map<String, User> _userDataCache = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0),
      controller: widget.scrollController,
      itemCount: widget.userIds.length,
      itemBuilder: (context, index) {
        String userId = widget.userIds[index];

        // Check if user data for this user ID is already in cache
        if (!_userDataCache.containsKey(userId)) {
          // If not, fetch user data and store the future in cache
          _futureCache[userId] ??= _fetchUserData(userId);
          return Column(
            children: [
              _buildUserTileFromCache(userId),
              if (index != widget.userIds.length - 1)
                const Divider(
                  height: 0,
                  color: Color(0xFF2C2C2C),
                )
            ],
          );
        } else {
          // Use cached user data
          return Column(
            children: [
              _buildUserTileFromCache(userId),
              if (index != widget.userIds.length - 1)
                const Divider(
                  height: 0,
                  color: Color(0xFF2C2C2C),
                )
            ],
          );
        }
      },
    );
  }

  Future<User> _fetchUserData(String userId) async {
    try {
      final userData = await _meetController.getUser(userId);
      _userDataCache[userId] = userData;

      return userData;
    } catch (e) {
      // Handle error
      return Future.error(e);
    }
  }

  Widget _buildUserTileFromCache(String userId) {
    final user = _userDataCache[userId];
    if (user == null) {
      return const CircularProgressIndicator();
    } else {
      return Participant(
        image: Image.asset("assets/images/miqqra.png"),
        name: "${user.firstName} ${user.lastName}",
        id: user.nickname,
      );
    }
  }
}
