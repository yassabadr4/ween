import 'package:go_router/go_router.dart';
import 'package:ween/features/Auth/forget_password.dart';
import 'package:ween/features/Auth/login_page.dart';
import 'package:ween/features/Auth/otp_page.dart';
import 'package:ween/features/Home/presentaion/views/search_view.dart';
import 'package:ween/features/Home/presentaion/views/setting_view.dart';
import '../../Features/Splash/splash_view.dart';
import '../../features/Create Store/pressentaion/views/create_view.dart';
import '../../features/Home/presentaion/views/details_view.dart';
import '../../features/Home/presentaion/views/home_view.dart';
import '../../features/Home/presentaion/views/widgets/grid_view_body.dart';
import '../../features/Splash/onboarding.dart';

abstract class AppRouter {
  static const kOnBoarding = '/OnBoarding';
  static const kHomeView = '/HomeView';
  static const kGridViewBody = '/GridViewBody';

  static const kDetailsView = '/DetailsView';
  static const kLogInPage = '/LogInPage';
  static const kCreateView = '/CreateView';
  static const kForgetPassword = '/ForgetPassword';
  static const kOtpPage = '/OtpPage';
  static const kSettingView = '/Setting';
  static const kSearchView = '/SearchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kOnBoarding,
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      path: kGridViewBody,
      builder: (context, state) => const GridViewBody(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) =>  HomeView(),
    ),
    GoRoute(
      path: kDetailsView,
      builder: (context, state) => const DetailsView(),
    ),
    GoRoute(
      path: kLogInPage,
      builder: (context, state) => const LogInPage(),
    ),
    GoRoute(
      path: kCreateView,
      builder: (context, state) => const CreateView(),
    ),
    GoRoute(
      path: kForgetPassword,
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(
      path: kOtpPage,
      builder: (context, state) => const OtpPage(),
    ),
    GoRoute(
      path: kSettingView,
      builder: (context, state) => SettingView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
