class AppLinks {
  static const MAP = '/';
  static const PROFILE = '/profile';
}

class AuthLinks {
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_STEP_1 = '$REGISTER/step1';
}

class MeetLinks {
  static const BASE = '/meet';
}

class MeetCreationLinks {
  static const BASE = '${MeetLinks.BASE}/meetCreation';
  static const STEP_1 = '$BASE/step1';
  static const STEP_2 = '$BASE/step2';
  static const STEP_3 = '$BASE/step3';
}
