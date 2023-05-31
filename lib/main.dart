
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/firebase_options.dart';
import 'package:grab_meals/screens/about_screen.dart';
import 'package:grab_meals/screens/change_address_screen.dart';
import 'package:grab_meals/screens/checkout_screen.dart';
import 'package:grab_meals/screens/dessert_screen.dart';
import 'package:grab_meals/screens/forgot_password.dart';
import 'package:grab_meals/screens/homescreen.dart';
import 'package:grab_meals/screens/inbox_screen.dart';
import 'package:grab_meals/screens/individual_item.dart';
import 'package:grab_meals/screens/landing_screen.dart';
import 'package:grab_meals/screens/login.dart';
import 'package:grab_meals/screens/menu_screen.dart';
import 'package:grab_meals/screens/more_screen.dart';
import 'package:grab_meals/screens/notification_screen.dart';
import 'package:grab_meals/screens/offers_screen.dart';
import 'package:grab_meals/screens/onboarding_screens.dart';
import 'package:grab_meals/screens/order_screen.dart';
import 'package:grab_meals/screens/otp_screen.dart';
import 'package:grab_meals/screens/payment_screen.dart';
import 'package:grab_meals/screens/profile_screen.dart';
import 'package:grab_meals/screens/register_number.dart';
import 'package:grab_meals/screens/sign_up.dart';
import 'package:grab_meals/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'providers/otp_provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DeviceOrientation.portraitUp;
  DeviceOrientation.portraitDown;

 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform
 );
  runApp(const MyApp());
}
Future initialization(BuildContext? context) async{
  await Future.delayed(const Duration(seconds: 3));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OtpProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          fontFamily: 'Metropolis',
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
              shape: MaterialStateProperty.all(const StadiumBorder()),
              elevation: MaterialStateProperty.all(0)
            )
          ),
          textTheme: const TextTheme(
              headline3: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              headline4: TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              headline5: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.normal,
                fontSize: 25,
              ),
            headline6: TextStyle(
              color: AppColors.primary,
              fontSize: 28,

            ),
            bodyText2: TextStyle(
              color: AppColors.secondary
            )
          )
        ),
        home: const SplashScreen(),
        routes: {
          OnboardingScreens.routeName: (context) => const OnboardingScreens(),
          NumberRegistration.routeName: (context) => const NumberRegistration(),
          LandingScreen.routeName: (context) => const LandingScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          ForgotPassScreen.routeName: (context) => const ForgotPassScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          IndividualItem.routeName: (context) => const IndividualItem(),
          MenuScreen.routeName: (context) => const MenuScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          MoreScreen.routeName: (context) => const MoreScreen(),
          OffersScreen.routeName: (context) => const OffersScreen(),
          DessertScreen.routeName: (context) => const DessertScreen(),
          PaymentScreen.routeName: (context) => const PaymentScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          NotificationScreen.routeName: (context) => const NotificationScreen(),
          AboutScreen.routeName: (context) => const AboutScreen(),
          InboxScreen.routeName: (context) => const InboxScreen(),
          CheckoutScreen.routeName: (context) => const CheckoutScreen(),
          ChangeAddressScreen.routeName: (context) => const ChangeAddressScreen()

        },
      ),
    );
  }
}
