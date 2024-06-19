import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hello_flutter/domain/model/base_exception.dart';
import 'package:hello_flutter/presentation/base/base_argument.dart';
import 'package:hello_flutter/presentation/base/base_route.dart';
import 'package:hello_flutter/presentation/base/base_state.dart';
import 'package:hello_flutter/presentation/localization/text_id.dart';
import 'package:hello_flutter/presentation/localization/ui_text.dart';
import 'package:hello_flutter/util/app_logger.dart';
import 'package:http/http.dart';

abstract class BaseViewModel<A extends BaseArgument> {
  bool isLoading = false;

  final ValueNotifier<BaseState> _baseState = ValueNotifier(BaseState());

  ValueListenable<BaseState> get baseState => _baseState;

  //This will be called from UI once the widget is fully rendered
  void onViewReady({A? argument}) {}

  @protected
  void onDispose() {
    _baseState.dispose();
  }

  @protected
  void showLoadingDialog() {
    if (isLoading) return;
    isLoading = true;
    _baseState.value = ShowLoadingDialogBaseState();
  }

  @protected
  void dismissLoadingDialog() {
    if (!isLoading) return;
    isLoading = false;
    _baseState.value = DismissLoadingDialogBaseState();
  }

  @protected
  void navigateToScreen({
    required BaseRoute destination,
    bool? isReplacement,
    void Function()? onPop,
  }) {
    _baseState.value = NavigateBaseState(
      destination: destination,
      isReplacement: isReplacement ?? false,
      onPop: onPop,
    );
  }

  @protected
  void navigateBack() {
    _baseState.value = NavigateBackBaseState();
  }

  @protected
  void showToast({required UiText uiText}) {
    _baseState.value = ShowToastBaseState(uiText: uiText);
  }

  /// This method can be used to handle the error and show localized error message
  @protected
  void handleError({
    required BaseException baseError,
    bool shouldShowToast = true,
  }) {
    _baseState.value = HandleErrorBaseState(
      baseError: baseError,
      shouldShowToast: shouldShowToast,
    );
  }

  /// This method can be used to call repository methods and handle the loading and error states
  @protected
  Future<T> loadData<T>(
    Future<T> Function() function, {
    bool showLoading = true,
    bool shouldShowToast = true,
  }) async {
    try {
      if (showLoading) {
        showLoadingDialog();
      }
      final f = await function().catchError((e) {
        //This will catch the Future.error thrown from the repository
        throw e;
      });
      return f;
    } on BaseException catch (e) {
      handleError(
        baseError: e,
        shouldShowToast: shouldShowToast,
      );
      AppLogger.e("BaseViewModel: BaseException: Load Data Error: $e");
      return Future.error(e);
    } on Error catch (e) {
      AppLogger.e("BaseViewModel: Error: Load Data Error: $e");
      return Future.error(e);
    } on ClientException catch (e) {
      showToast(
          uiText: DynamicUiText(
              textId: PleaseCheckYourInternetConnection(),
              fallbackText: "Please check your internet connection"));
      AppLogger.e("BaseViewModel: ClientException Load Data Error: $e");
      return Future.error(e);
    } on Exception catch (e) {
      AppLogger.e("BaseViewModel: Load Data Error: $e");
      return Future.error(e);
    } finally {
      dismissLoadingDialog();
    }
  }
}
