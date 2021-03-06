import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

typedef void TapHandler(int index);

class HomeBottomNavigator extends StatelessWidget {
  final Map<HomeTabId, HomeTab> tabs;
  final TapHandler onTapped;
  final HomeTabId currentTabId;
  const HomeBottomNavigator(this.tabs, this.currentTabId, this.onTapped);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: Key('bottom_nav_bar'),
      onTap: this.onTapped,
      currentIndex: homeTabId2Index(currentTabId),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(this.tabs[HomeTabId.SHOPPING].icon,
              key: this.tabs[HomeTabId.SHOPPING].btnKey),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(this.tabs[HomeTabId.SHOPPING].title),
        ),
        BottomNavigationBarItem(
          icon: Icon(this.tabs[HomeTabId.CARD_MANAGEMENT].icon,
              key: this.tabs[HomeTabId.CARD_MANAGEMENT].btnKey),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(this.tabs[HomeTabId.CARD_MANAGEMENT].title),
        ),
        BottomNavigationBarItem(
          icon: Icon(this.tabs[HomeTabId.USER_SETTINGS].icon,
              key: this.tabs[HomeTabId.USER_SETTINGS].btnKey),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(this.tabs[HomeTabId.USER_SETTINGS].title),
        ),
        BottomNavigationBarItem(
          icon: Icon(this.tabs[HomeTabId.CONTRIB].icon,
              key: this.tabs[HomeTabId.CONTRIB].btnKey),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(this.tabs[HomeTabId.CONTRIB].title),
        ),
      ],
    );
  }
}
