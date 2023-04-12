import 'package:flutter/material.dart';
import 'package:talenti_test/features/data/models/menu.dart';
import 'package:talenti_test/features/ui/pages/character_page.dart';
import 'package:talenti_test/features/ui/pages/favorites_page.dart';
import 'package:talenti_test/features/ui/pages/home_page.dart';
import 'package:talenti_test/features/ui/pages/search_page.dart';
import 'package:talenti_test/features/ui/utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  final Function onHomePress;
  final Function onSearchPress;
  final Function onFavoritesPress;
  final Function onCharacterPress;

  const SideBar(
      {super.key,
      required this.onHomePress,
      required this.onSearchPress,
      required this.onFavoritesPress,
      required this.onCharacterPress});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent[400]?.withOpacity(0.6),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Hector Luis",
                bio: "Developer",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Alternative browser".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ListView.builder(
                itemCount: sidebarMenus.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Menu menu = sidebarMenus[index];
                  return SideMenu(
                    menu: menu,
                    selectedMenu: selectedSideMenu,
                    press: () {
                      RiveUtils.chnageSMIBoolState(menu.rive.status!);
                      setState(() {
                        selectedSideMenu = menu;
                        if (menu.title == "Home") {
                          widget.onHomePress();
                        } else if (menu.title == "Search characters") {
                          widget.onSearchPress();
                        } else if (menu.title == "Episodes") {
                          widget.onFavoritesPress();
                        } else if (menu.title == "Characters") {
                          widget.onCharacterPress();
                        }
                      });
                    },
                    riveOnInit: (artboard) {
                      menu.rive.status = RiveUtils.getRiveInput(artboard,
                          stateMachineName: menu.rive.stateMachineName);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
