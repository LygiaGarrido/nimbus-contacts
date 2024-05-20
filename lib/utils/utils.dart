import 'package:flutter/material.dart';

import 'app_color_constants.dart';

class Utils {
  static void showErrorDialog(BuildContext context, IconData icon,
      String errorTitle, String errorDescription) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          color: appPrimaryColor,
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            icon,
                            color: appYellowColor,
                            size: 32,
                          ),
                          Text(
                            errorTitle,
                            style: const TextStyle(
                              color: appYellowColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      errorDescription,
                      style: const TextStyle(
                        color: appPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void showLoadingAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            content: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: appPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(color: appPrimaryColor),
                  )
                ],
              ),
            ),
          );
        });
  }

  static Widget showLoading() {
    return Container(
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(
          backgroundColor: appBackgroundColor,
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(appPrimaryColor),
        ),
      ),
    );
  }

  static SnackBar showCustomSnackBar(String message) {
    return SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
  }

  static void showConfirmationDialog(
      {required BuildContext context,
      required IconData icon,
      required String confirmationTitle,
      required String confirmationDescription,
      required Function() onTapConfirm}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 90,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          color: appPrimaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Icon(
                              icon,
                              color: appYellowColor,
                              size: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                confirmationTitle,
                                style: const TextStyle(
                                  color: appYellowColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Text(
                      confirmationDescription,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: appPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: onTapConfirm,
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
