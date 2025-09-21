import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

class HomeGridViewItem extends StatelessWidget {
  final ProductEntity productEntity;
  const HomeGridViewItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.lightGrey2,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                    vertical: AppPadding.p6,
                  ),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: productEntity.productImage,
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          width: AppSize.s24,
                          height: AppSize.s24,
                          child: CustomLoadingIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: ColorManager.lightGrey,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          color: ColorManager.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: AppSize.s12,
                top: AppSize.s12,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.elevationColor.withValues(
                          alpha: 0.25,
                        ),
                        offset: const Offset(0, AppSize.s8),
                        blurRadius: AppSize.s10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p4),
                    child: SvgPicture.asset(
                      AssetsManager.favorite,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productEntity.productName,
              style: StylesManager.textStyle16Sem(ColorManager.primaryColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  '\$ ${productEntity.productPrice}',
                  style: StylesManager.textStyle12Med(
                    ColorManager.primaryColor,
                  ),
                ),
                Text(
                  '  -52%',
                  style: StylesManager.textStyle12Med(ColorManager.error),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
