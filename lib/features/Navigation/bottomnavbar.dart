import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/features/Navigation/programs_from_nav.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import '../../Repository/generic_repository.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../partGuide/videos_list.dart';
import 'homepage.dart';
import 'logbook.dart';
import 'schedule_from_nav.dart';

class BottomNavbar extends ConsumerWidget {
  BottomNavbar({Key? key}) : super(key: key);
  final tabs = [
    const MyHomePage(),
    const ScheduleFromNav(),
    const ProgramsFromNav(),
    const VideoListView(),
    const LogBook(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController();
    final currentPage = ref.watch(barNavigationProvider);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: tabs,
        onPageChanged: (index) =>
            ref.read(barNavigationProvider.notifier).state = index,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: AppColors.cAvatarImage),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: SizedBox(
            height: 75,
            child: BottomNavigationBar(
              fixedColor: AppColors.cTheme,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              unselectedItemColor: AppColors.cGrey,
              elevation: 0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.shifting,
              backgroundColor: Colors.grey[300],
              currentIndex: currentPage,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ImageIcon(
                          AssetImage(ImagePath.navbarDashboardIcon),
                          size: (currentPage == 0) ? 25 : 20,
                        ),
                      ),
                      (currentPage == 0)
                          ? TextInit(
                              textIn: Document.navbarTitles[0],
                              fSize: 11,
                              fontWeight: FontWeight.bold,
                            )
                          : const Text('')
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ImageIcon(
                          AssetImage(ImagePath.navbarScheduleIcon),
                          size: (currentPage == 1) ? 25 : 20,
                        ),
                      ),
                      (currentPage == 1)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: TextInit(
                                textIn: Document.navbarTitles[1],
                                fSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text('')
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ImageIcon(
                            AssetImage(ImagePath.navbarProgramIcon),
                            size: (currentPage == 2) ? 25 : 20),
                      ),
                      (currentPage == 2)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: TextInit(
                                textIn: Document.navbarTitles[2],
                                fSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(''),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ImageIcon(AssetImage(ImagePath.navbarGuideIcon),
                            size: (currentPage == 3) ? 25 : 20),
                      ),
                      (currentPage == 3)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: TextInit(
                                textIn: Document.navbarTitles[3],
                                fSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(''),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ImageIcon(
                              AssetImage(
                                ImagePath.navbarLogbookIcon,
                              ),
                              size: (currentPage == 4) ? 25 : 20),
                        ),
                        (currentPage == 4)
                            ? Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: TextInit(
                                  textIn: Document.navbarTitles[4],
                                  fSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(''),
                      ],
                    ),
                    label: ''),
              ],
              onTap: (index) {
                ref.read(barNavigationProvider.notifier).state = index;
                controller.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
