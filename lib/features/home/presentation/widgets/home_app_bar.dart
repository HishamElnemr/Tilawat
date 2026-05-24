import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tilawat/core/theme/app_colors.dart';
import 'package:tilawat/core/theme/cubit/change_theme_cubit.dart';
import 'package:tilawat/core/utils/app_images.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(49);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final buttonColor = isDark
        ? AppColors.backgroundSecondaryDark
        : AppColors.backgroundSecondaryLight;
    final iconColor = colorScheme.onSurface;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: colorScheme.surface,
      toolbarHeight: preferredSize.height,
      shape: Border(bottom: BorderSide(color: colorScheme.outline, width: 1)),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: const _TitleLogo()),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  _HeaderIconButton(
                    backgroundColor: buttonColor,
                    onPressed: () {
                      context.read<ChangeThemeCubit>().toggleTheme();
                    },
                    child: SvgPicture.asset(
                      isDark ? Assets.assetsImagesSun : Assets.assetsImagesMoon,
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(width: 6),
                  _HeaderIconButton(
                    backgroundColor: buttonColor,
                    onPressed: () {},
                    child: SvgPicture.asset(
                      Assets.assetsImagesSearchNormal,
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleLogo extends StatelessWidget {
  const _TitleLogo();

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurface;

    return Row(
      children: [
        Image.asset(
          Assets.assetsImagesLogoMain,
          width: 36,
          height: 36,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'تِلاوَات كَفْر بِهِيدَة',
            maxLines: 2,
            softWrap: true,
            style: AppStyles.heading3Bold18(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 17),
              color: iconColor,
              letterSpacing: 0.17,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.backgroundColor,
    required this.onPressed,
    required this.child,
  });

  final Color backgroundColor;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: child,
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
      ),
    );
  }
}
