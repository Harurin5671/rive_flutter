import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_flutter/infrastructure/infrastructure.dart';
import 'package:rive_flutter/utils/rive_utils.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAssets selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                name: 'Frank Santos',
                profession: 'Developer',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  'Browse'.toUpperCase(),
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                   riveOnInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  'History'.toUpperCase(),
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
              ...sideMenuHistory.map(
                (menu) => SideMenuTile(
                  menu: menu,
                   riveOnInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
