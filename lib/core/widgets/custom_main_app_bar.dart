import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_images.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainAppBar({
    super.key,
    required this.title,
    this.showAction = false,
  });

  final String title;
  final bool showAction;

  @override
  Size get preferredSize => const Size.fromHeight(61);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      titleSpacing: 20,
      title: Row(
        children: [
          if (showAction)
            DecoratedBox(
              decoration: BoxDecoration(
                color: Color.alphaBlend(
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.30),
                  Theme.of(context).colorScheme.surface,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: 34,
                height: 34,
                child: IconButton(
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.75),
                  ),
                ),
              ),
            ),
          SizedBox(width: 8),
          Text(
            title,
            style: AppStyles.heading3Bold18(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 17),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const Spacer(),
          Image.asset(
            Assets.assetsImagesLogoMain,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
