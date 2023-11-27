import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class Version3AuthUser {
  Version3AuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Version3AuthUser> version3AuthUserSubject =
    BehaviorSubject.seeded(Version3AuthUser(loggedIn: false));
Stream<Version3AuthUser> version3AuthUserStream() => version3AuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
