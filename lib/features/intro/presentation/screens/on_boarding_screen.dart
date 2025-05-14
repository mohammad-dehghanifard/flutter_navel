import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navel/common/widgets/custom_button_widget.dart';
import 'package:flutter_navel/core/constants/app_colors.dart';
import 'package:flutter_navel/core/constants/diemsn.dart';
import 'package:flutter_navel/core/extensions/sizedbox_extension.dart';
import 'package:flutter_navel/core/gen/assets.gen.dart';
import 'package:flutter_navel/features/intro/data/models/on_boarding_model.dart';
import 'package:flutter_navel/features/intro/presentation/cubits/on_boarding_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onBoarding";

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> items = [
      OnBoardingModel(
        imagePath: Assets.image.onBoarding1.path,
        text: "Explore the \nbeauty of the \nworld !",
        location: "Kelingking Beach, Indoensia",
      ),
      OnBoardingModel(
        imagePath: Assets.image.onBoarding2.path,
        text: "Enjoy \nyour travel\n experience",
        location: "Oro oro Ombo, Indoensia",
      ),
      OnBoardingModel(
        imagePath: Assets.image.onBoarding3.path,
        text: "Let’s make \nyour dream \ntravel",
        location: "Kelingking Beach, Indoensia",
      ),
    ];

    return Scaffold(
      body: BlocProvider<OnBoardingCubit>(
        create: (context) => OnBoardingCubit(),
        child: Builder(
          builder: (context) {
            return BlocBuilder<OnBoardingCubit, int>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                print(state);
                return Stack(
              children: [
                // image
                Positioned.fill(
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                      color: AppColors.darkGreenColor.withAlpha(80),
                    ),
                    child: AnimatedSwitcher(duration: Duration(milliseconds: 250),child: Image.asset(items[state].imagePath),),
                  ),
                ),
            
                // text && indicator && location
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.pagesMargin),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // text
                        Text(
                          items[state].text,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Dimens.medium12.height,
            
                        // indicator
                        Row(
                          spacing: Dimens.small8,
                          children: List.generate(
                            3,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 450),
                              width: 11,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withAlpha(80),
                              ),
                            ),
                          ),
                        ),
                        Dimens.medium12.height,
            
                        // location && button
                        Row(
                          spacing: Dimens.small4,
                          children: [
                            SvgPicture.asset(Assets.svg.location, height: 18),
                            Text(
                                items[state].location,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
            
                            // next button
                            Expanded(
                              child: CustomButtonWidget(
                                onTap: () {
                                  if(state < items.length) {
                                    BlocProvider.of<OnBoardingCubit>(context).updateSelectedIndex(newIndex: state++);
                                  }
                                  
                                },
                                height: 60,
                                radius: Dimens.large24,
                                child: SvgPicture.asset(
                                  Assets.svg.rightarrow,
                                  width: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
  },
);
          }
        ),
      ),
    );
  }
}
