import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/routes/home_paths.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 1;
  @override
  initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0;
      });
      Future.delayed(const Duration(seconds: 1), () {
        context.goNamed(HomePaths.HOME_PAGE);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: Image.network(
                'https://www.icegif.com/wp-content/uploads/2022/11/icegif-1194.gif',
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
