import 'package:always_marketing_application/screens/screens.dart';
import 'package:get/get.dart';

class AppRoute {
  // Splash Route
  static const splashScreen = '/splash_screen';

  // Auth Route
  static const loginScreen = '/login_screen';
  static const profileScreen = '/profile_screen';

  // Home Route
  static const homeScreen = '/home_screen';
  static const homeGuestScreen = '/home_guest_screen';

  // Survey Route
  static const surveyGuestScreen = '/survey_guest_screen';
  static const surveyScreen = '/survey_screen';
  static const successScreen = '/success_screen';
  static const createSurveyScreen = '/create_survey_screen';
  static const createSurveyQuestionScreen = '/create_survey_question_screen';

  static final routes = [
    // Splash Route
    GetPage(name: splashScreen, page: () => const SplashScreen()),

    // Login Route
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),

    // Home Route
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: homeGuestScreen, page: () => const HomeGuestScreen()),

    // Survey Route
    GetPage(name: surveyGuestScreen, page: () => const SurveyGuestScreen()),
    GetPage(name: surveyScreen, page: () => const SurveyScreen()),
    GetPage(name: successScreen, page: () => const SuccessScreen()),
    GetPage(name: createSurveyScreen, page: () => const CreateSurveyScreen()),
    GetPage(
        name: createSurveyQuestionScreen,
        page: () => const CreateSurveyQuestionScreen()),
  ];
}
