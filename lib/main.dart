import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/features/partDashboard/chat.dart';
import 'package:healthandwellness/features/partDashboard/dashboard_trainers.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import 'package:healthandwellness/features/Authentication/register_user.dart';
import 'package:healthandwellness/features/Authentication/sign_in.dart';
import 'package:healthandwellness/features/Navigation/homepage.dart';
import 'package:healthandwellness/features/WelcomeScreens/onboarding.dart';
import 'package:healthandwellness/features/WelcomeScreens/splash_screen.dart';
import 'package:healthandwellness/features/partPrograms/program_starter_screen.dart';
import 'package:healthandwellness/features/partSchedule/add_schedule.dart';
import 'package:healthandwellness/features/part_logbook/log_book_item_screen.dart';
import 'features/Navigation/programs_from_nav.dart';
import 'features/buyPackage/buy_package.dart';
import 'features/partDashboard/dashboard_trainer_profile.dart';
import 'features/partGuide/videos_list.dart';
import 'features/partPrograms/program_overview.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: GuideFromNav(),
      initialRoute: RouteAddress.landingPage,
      routes: {
        RouteAddress.landingPage: ((context) => const SplashScreen()),
        RouteAddress.onboarding: ((context) => const Onboarding()),
        RouteAddress.signUp: ((context) => RegisterUser()),
        RouteAddress.signIn: ((context) => SignIn()),
        RouteAddress.program: ((context) => const ProgramsFromNav()),
        RouteAddress.home: ((context) => const MyHomePage()),
        RouteAddress.addSchedule: ((context) => AddSchedule()),
        RouteAddress.buyPackage: ((context) => const BuyPackage()),
        RouteAddress.workOutVideos: ((context) => const VideoListView()),
        RouteAddress.programOverview: ((context) => const ProgramOverview()),
        RouteAddress.trainerProfileDashboard: ((context) =>
            const DashboardTrainerProfile()),
        RouteAddress.programStartScreen: ((context) =>
            const ProgramStarterScreen()),
        RouteAddress.logBookItemScreen: ((context) =>
            const LogBookItemScreen()),
        RouteAddress.dashBoardTrainerProfilePage: ((context) =>
            const DashboardTrainerProfile()),
        RouteAddress.dbTrainersPAge: ((context) => const DashBoardTrainers()),
        RouteAddress.tChatScreen: ((context) => ChatScreen()),
      },
      title: 'Health And Wellness',
    );
  }
}
