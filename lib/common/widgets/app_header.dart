import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_forge/common/constants/icon_resource.dart';

import '../constants/size_global.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  AppHeader({
    super.key,
    this.text,
    this.onLeadingPressed,
    this.onTitlePressed,
    this.leadingIcon = LeadingIcon.back,
    this.titleType = AppBarTitle.text,
    this.centerTitle,
    this.elevation,
    this.actions,
    this.height,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.bottom,
    this.shadowColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.leadingWidth,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.leadingIconColor,
  }) : preferredSize = Size.fromHeight(height ?? kToolbarHeight);

  final String? text;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTitlePressed;
  final LeadingIcon leadingIcon;
  final AppBarTitle titleType;
  final bool? centerTitle;
  final double? elevation;
  final List<Widget>? actions;
  final double? height;
  final bool automaticallyImplyLeading;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? leadingWidth;
  final TextStyle? titleTextStyle;
  final Color? leadingIconColor;
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      leadingWidth: leadingWidth,
      systemOverlayStyle: systemOverlayStyle,
      leading: leadingIcon == LeadingIcon.none
          ? null
          : IconButton(
              onPressed: onLeadingPressed ?? () => _onPop(context),
              icon: SvgPicture.asset(
                IconResource.iconArrowLeft,
                width: 30,
              ),
            ),
      centerTitle: centerTitle,
      title: GestureDetector(
        onTap: onTitlePressed,
        behavior: HitTestBehavior.translucent,
        child: titleType == AppBarTitle.text
            ? Text(text ?? '', style: titleTextStyle)
            : titleType == AppBarTitle.logo
                ? SvgPicture.asset(IconResource.arrowLeft) // [note]: change logo at here
                : null,
      ),
      actions: actions,
      elevation: elevation,
    );
  }

  void _onPop(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom.toInt() > 0;

    if (isKeyboardVisible) context.hideKeyboard();
    Future.delayed(isKeyboardVisible ? const ShortDuration() : Duration.zero, () => Navigator.of(context).pop());
  }
}

enum LeadingIcon {
  back,
  close,
  none,
}

enum AppBarTitle {
  logo,
  text,
  none,
}
