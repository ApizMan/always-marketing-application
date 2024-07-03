import 'package:always_marketing_application/constant.dart';
import 'package:always_marketing_application/resources/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class BackgroundTemplate extends StatelessWidget {
  final Widget child;
  final bool? isStaff, hasBackButton, isHomePage;
  final Widget? title;
  final Function()? onPressed;
  const BackgroundTemplate({
    super.key,
    required this.child,
    this.isStaff = true,
    this.hasBackButton = true,
    this.isHomePage = true,
    this.title = const SizedBox(),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: !isStaff!
          ? AppBar(
              foregroundColor: kWhiteColor,
              backgroundColor: Colors.transparent,
              title: Image(
                image: const AssetImage(logoWhite),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              centerTitle: true,
            )
          : !hasBackButton!
              ? AppBar(
                  foregroundColor: kWhiteColor,
                  backgroundColor: Colors.transparent,
                  title: title,
                  centerTitle: true,
                )
              : AppBar(
                  foregroundColor: kWhiteColor,
                  backgroundColor: Colors.transparent,
                  titleSpacing: -20,
                  title: Image(
                    image: const AssetImage(logoWhite),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ScaleTap(
                        onPressed: () => Navigator.pushNamed(
                            context, AppRoute.profileScreen),
                        child: const Image(
                          image: AssetImage('assets/images/avatar_image.png'),
                        ),
                      ),
                    ),
                  ],
                ),
      floatingActionButton: isStaff! && isHomePage!
          ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              shape: const CircleBorder(),
              onPressed: onPressed,
              child: const Icon(
                Icons.add,
                color: kWhiteColor,
              ),
            )
          : const SizedBox(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
