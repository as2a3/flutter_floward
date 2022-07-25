import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingErrorEmptyWidget extends StatelessWidget {
  const LoadingErrorEmptyWidget({
    Key? key,
    this.isLoading = false,
    this.isLoadingError = false,
    this.errorText = '',
    this.isEmptyData = false,
    this.loadingHeight = 300,
    this.retryAction,
    required this.child,
    this.emptyWidget,
  }) : super(key: key);

  final bool isLoading;
  final bool isLoadingError;
  final String errorText;
  final bool isEmptyData;
  final double loadingHeight;
  final VoidCallback? retryAction;
  final Widget child;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(),);
    }
    if (isLoadingError) {
      return LoadingErrorWidget(
        msg: errorText,
        retryAction: () => retryAction?.call(),
      );
    }
    if (isEmptyData) {
      return emptyWidget ?? const NoDataFoundWidget();
    }
    return child;
  }
}

class LoadingErrorWidget extends StatelessWidget {
  final String msg;
  final VoidCallback? retryAction;

  const LoadingErrorWidget({
    Key? key,
    this.msg = '',
    this.retryAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(
          16,
        ),
        elevation: 8.0,
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: const AssetImage(loadingError),
              //   width: Get.width * 0.2,
              //   // width: (MediaQuery.of(context).orientation ==
              //   //     Orientation.landscape ||
              //   //     Tools.isTablet(MediaQuery.of(context)))
              //   //     ? 100
              //   //     : 70,
              // ),
              // const SizedBox(
              //   height: 16.0,
              // ),
              Text(
                msg != '' ? msg : 'Default Error Message'.tr,
                style: Get.textTheme.headline5!.copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              if (retryAction != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(),
                    ElevatedButton(
                      child: Text('Retry'.tr),
                      onPressed: () => retryAction?.call(),
                      // textColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoDataFoundWidget extends StatelessWidget {
  final String msg;
  final double size;

  const NoDataFoundWidget({
    Key? key,
    this.msg = '',
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8.0,
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: const AssetImage(
              //     noDataFound,
              //   ),
              //   width: size,
              // ),
              Icon(
                Icons.notes,
                size: size,
                color: Get.theme.colorScheme.secondary,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                msg != '' ? msg : 'No data found'.tr,
                style: Get.textTheme.headline5!.copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

