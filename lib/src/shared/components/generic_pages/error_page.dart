import 'package:flutter/material.dart';

/// [CScreenInformation] is a widget that shows a screen with information.
class CScreenInformation extends StatelessWidget {
  final String assetImage;
  final String subject;
  final String description;
  final String buttonLabel;
  final List<Widget>? children;
  final VoidCallback? onTap;

  const CScreenInformation({
    Key? key,
    this.assetImage = '',
    required this.subject,
    required this.description,
    this.onTap,
    this.buttonLabel = 'Tentar novamente',
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (_, c) {
        return SafeArea(
          child: Container(
            width: c.maxWidth,
            height: c.maxHeight,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 55),
            child: SingleChildScrollView(
              physics: children == null ? null : const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                  ),
                  const SizedBox(height: 32),
                  Visibility(
                    visible: children != null,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children ?? [],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: onTap != null,
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
