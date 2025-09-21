import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/constrained_scaffold.dart';
import 'package:styla/core/widgets/custom_appbar.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConstrainedScaffold(
      appBar: CustomAppbar(title: StringsManager.notification),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: .7),
            SizedBox(height: AppSize.s10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TodaySection(),
                    Divider(thickness: .7),
                    SizedBox(height: AppSize.s10),
                    YesterdaySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodaySection extends StatelessWidget {
  const TodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.today,
          style: StylesManager.textStyle16Sem(ColorManager.primaryColor),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SvgPicture.asset(AssetsManager.discountIcon),
              title: Text(
                '30% Special Discount!',
                style: StylesManager.textStyle14Sem(
                  ColorManager.primaryColor,
                ),
              ),
              subtitle: Text(
                'Special promotion only valid today.',
                style: StylesManager.textStyle12Reg(
                  ColorManager.grey,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class YesterdaySection extends StatelessWidget {
  const YesterdaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.yesterday,
          style: StylesManager.textStyle16Sem(ColorManager.primaryColor),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SvgPicture.asset(AssetsManager.walletIcon),
              title: Text(
                'Top Up E-wallet Successfully!',
                style: StylesManager.textStyle14Sem(
                  ColorManager.primaryColor,
                ),
              ),
              subtitle: Text(
                'You have top up your e-wallet.',
                style: StylesManager.textStyle12Reg(
                  ColorManager.grey,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
