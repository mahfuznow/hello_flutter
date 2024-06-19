import 'package:flutter/foundation.dart';
import 'package:hello_flutter/data/local/shared_preference/entity/user_session_shared_preference_entity.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import 'package:hello_flutter/presentation/feature/home/bottom_navigation_item_type.dart';
import 'package:hello_flutter/presentation/feature/home/route/home_argument.dart';
import 'package:hello_flutter/util/app_logger.dart';

class HomeViewModel extends BaseViewModel<HomeArgument> {
  final ValueNotifier<String?> _userId = ValueNotifier(null);

  ValueListenable<String?> get userId => _userId;

  final List<NavigationItemType> navigationItems = NavigationItemType.values;

  static const int initialPageIndex = 0;

  final ValueNotifier<int> _currentPageIndex = ValueNotifier(initialPageIndex);

  ValueListenable<int> get currentPageIndex => _currentPageIndex;

  @override
  onViewReady({HomeArgument? argument}) {
    AppLogger.d("HomeViewModel onViewReady");
    _userId.value = argument?.userId;

    _printUserSession();
  }

  void _printUserSession() {
    UserSessionSharedPreferenceEntity.example.getFromSharedPref().then((value) {
      AppLogger.d(value);
    });
  }

  void onPageChanged(int index) {
    _currentPageIndex.value = index;
  }

  void onNavigationItemClicked(int index) {
    _currentPageIndex.value = index;
  }

  onClickBack() {
    navigateBack();
  }
}
