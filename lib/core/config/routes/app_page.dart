abstract class Pages {
  static const home = _Paths.HOME;
  static const login = _Paths.LOGIN;
  static const initial = _Paths.INITIAL;
  static const nav = _Paths.NAV_BAR;
  static const no_screen = _Paths.NO_SCREEN;
  static const test_screen = _Paths.TEST_PAGE;
  static const participant = _Paths.Participent;
  static const new_cred = _Paths.NewCred;
  static const email_otp = _Paths.EmailOtp;
  static const pass_update = _Paths.PassUpdate;
  static const meeting_add = _Paths.MeetingAdd;
  static const meeting_confirm_page = _Paths.meeting_confirm;
  static const meeting_form = _Paths.MeetingForm;
  static const meeting_reschedule_confirm = _Paths.MeetingRescheduleConfirm;
  static const forgot_pass = _Paths.ForgotPassword;
  static const change_pass = _Paths.ChangePassword;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const INITIAL = '/initial-screen';
  static const NO_SCREEN = '/no-screen';
  static const TEST_PAGE = '/test-screen';
  static const NAV_BAR = '/nav';
  static const Participent = '/participent';
  static const NewCred = '/new_cred';
  static const EmailOtp = '/email_otp';
  static const PassUpdate = '/pass_update';
  static const MeetingAdd = '/meeting_add';
  static const MeetingForm = '/meeting_form';
  static const ForgotPassword = '/forgot_pass';
  static const ChangePassword = '/change_pass';
  static const MeetingRescheduleConfirm = '/meeting_reschedule_confirm';
  static const meeting_confirm = '/confirm-meeting';
}
