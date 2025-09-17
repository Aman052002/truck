import 'package:get/get.dart';

import '../modules/add_client/bindings/add_client_binding.dart';
import '../modules/add_client/views/add_client_view.dart';
import '../modules/addtruck/bindings/addtruck_binding.dart';
import '../modules/addtruck/views/addtruck_view.dart';
import '../modules/book_truck/bindings/book_truck_binding.dart';
import '../modules/book_truck/views/book_truck_view.dart';
import '../modules/bottom_bar/bindings/bottom_bar_binding.dart';
import '../modules/bottom_bar/views/bottom_bar_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/clients/bindings/clients_binding.dart';
import '../modules/clients/views/clients_view.dart';
import '../modules/drivers/bindings/drivers_binding.dart';
import '../modules/drivers/views/drivers_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/expense/bindings/expense_binding.dart';
import '../modules/expense/views/expense_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/maintenance/bindings/maintenance_binding.dart';
import '../modules/maintenance/views/maintenance_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/password_change/bindings/password_change_binding.dart';
import '../modules/password_change/views/password_change_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_view.dart';
import '../modules/terms_and_conditions/bindings/terms_and_conditions_binding.dart';
import '../modules/terms_and_conditions/views/terms_and_conditions_view.dart';
import '../modules/trip_management/bindings/trip_management_binding.dart';
import '../modules/trip_management/views/trip_management_view.dart';
import '../modules/trucks/bindings/trucks_binding.dart';
import '../modules/trucks/views/trucks_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_CHANGE,
      page: () => const PasswordChangeView(),
      binding: PasswordChangeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.TRUCKS,
      page: () => const TrucksView(),
      binding: TrucksBinding(),
    ),
    GetPage(
      name: _Paths.DRIVERS,
      page: () => const DriversView(),
      binding: DriversBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_AND_CONDITIONS,
      page: () => const TermsAndConditionsView(),
      binding: TermsAndConditionsBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_TRUCK,
      page: () => const BookTruckView(),
      binding: BookTruckBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE,
      page: () => const ExpenseView(),
      binding: ExpenseBinding(),
    ),
    GetPage(
      name: _Paths.TRIP_MANAGEMENT,
      page: () => const TripManagementView(),
      binding: TripManagementBinding(),
    ),
    GetPage(
      name: _Paths.ADDTRUCK,
      page: () => const AddtruckView(),
      binding: AddtruckBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CLIENT,
      page: () => const AddClientView(),
      binding: AddClientBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTS,
      page: () => const ClientsView(),
      binding: ClientsBinding(),
    ),
    GetPage(
      name: _Paths.MAINTENANCE,
      page: () => const MaintenanceView(),
      binding: MaintenanceBinding(),
    ),
  ];
}
