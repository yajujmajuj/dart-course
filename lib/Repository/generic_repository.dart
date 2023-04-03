import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/features/Navigation/logbook.dart';

// onboarding_screen_state_provider
final onboardingStateProvider = StateProvider<int>((ref) {
  return 0;
});

// signIn_remember_me_button_state
final rememberSignInProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// signUp_permission_state
final signUpPermissionProvider = StateProvider<bool>((ref) {
  return false;
});

// gender_selection_choice_sign_up
final genderChoiceProvider = StateProvider.autoDispose<GenderChoice>((ref) {
  return GenderChoice.male;
});

// app_navigation_state
final barNavigationProvider = StateProvider<int>((ref) {
  return 0;
});

// app_navigation_state
final dayWeekTileSwitch = StateProvider<int>((ref) {
  return 0;
});
final snackBarButtonProvider = StateProvider<List<bool>>((ref) {
  return Constant.watches;
});
//final logBookState = StateProvider<List<bool>>((ref) => Constant.tempListTitles);
