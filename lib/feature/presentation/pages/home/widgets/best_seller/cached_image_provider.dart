import 'package:cached_network_image/cached_network_image.dart';
import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/cupertino.dart';

class CachedImageProvider extends StatelessWidget {
  const CachedImageProvider({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imgProvider) =>
          _buildImageContainer(screenSize, imageProvider: imgProvider),
      placeholder: (context, url) {
        return const Center(
          child: CupertinoActivityIndicator(
            color: AppColors.accentColor,
          ),
        );
      },
    );
  }

  Container _buildImageContainer(
    Size screenSize, {
    required ImageProvider imageProvider,
  }) {
    return Container(
      height: screenSize.height * (165 / Constants.propHeight),
      width: screenSize.width * (181 / Constants.propWidth),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
