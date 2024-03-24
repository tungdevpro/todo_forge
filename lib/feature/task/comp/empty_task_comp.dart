import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/icon_resource.dart';
import '../../../common/constants/size_global.dart';

class EmptyTaskComp extends StatelessWidget {
  const EmptyTaskComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset(IconResource.iconNodata)),
        const SizedBox(height: SizeGlobal.paddingSM),
        const Text('No data yet'),
      ],
    );
  }
}
