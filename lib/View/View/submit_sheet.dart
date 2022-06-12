import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showFlexibleBookmarkSheet({
  BuildContext context,
  String sheetTitle,
  String approveText,
  String cancelText,
  VoidCallback approveCallback,
  VoidCallback cancelCallback,
}) async {
  showFlexibleBottomSheet<void>(
    context: context,
    minHeight: 0,
    initHeight: 0.35,
    maxHeight: 0.35,
    anchors: [0, 0.35],
    isExpand: true,
    isSafeArea: false,
    keyboardBarrierColor: Colors.transparent,
    bottomSheetColor: Colors.transparent,
    builder: (context, controller, offset) {
      return Container(
        width: context.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            )),
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          children: [
            Center(
                child: Text(
              sheetTitle ?? "",
              style: GoogleFonts.montserrat(fontSize: 17),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Expanded(
                      flex: 4,
                      child: ElevatedButton(
                        onPressed: approveCallback ?? () {},
                        child: FittedBox(child: Text(approveText ?? "Approve")),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.green)),
                      )),
                  const Spacer(),
                  Expanded(
                      flex: 4,
                      child: ElevatedButton(
                        onPressed: cancelCallback ?? () {},
                        child: FittedBox(child: Text(cancelText ?? "Cancel")),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.accentColor)),
                      )),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
