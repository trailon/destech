import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ListViewPlaceHolder extends StatelessWidget {
  const ListViewPlaceHolder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SkeletonListView(
      item: SkeletonListTile(
    verticalSpacing: 12,
    leadingStyle: const SkeletonAvatarStyle(
        width: 64, height: 64, shape: BoxShape.circle),
    titleStyle: SkeletonLineStyle(
        height: 16,
        minLength: 200,
        randomLength: true,
        borderRadius: BorderRadius.circular(12)),
    subtitleStyle: SkeletonLineStyle(
        height: 12,
        maxLength: 200,
        randomLength: true,
        borderRadius: BorderRadius.circular(12)),
    hasSubtitle: true,
      ),
    );
  }
}

class ParagraphPlaceHolder extends StatelessWidget {
  const ParagraphPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonParagraph(
        style: SkeletonParagraphStyle(
            lines: 4,
            lineStyle: SkeletonLineStyle(
                randomLength: true,
                borderRadius: BorderRadius.circular(12))));
  }
}

class AvatarPlaceHolder extends StatelessWidget {
  const AvatarPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
          width: 64,
          height: 64,
          shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

class ItemPlaceHolder extends StatelessWidget {
  const ItemPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: SkeletonListTile(
        verticalSpacing: 12,
        leadingStyle: const SkeletonAvatarStyle(
            width: 64, height: 64, shape: BoxShape.circle),
        titleStyle: SkeletonLineStyle(
            height: 16,
            minLength: 200,
            randomLength: true,
            borderRadius: BorderRadius.circular(12)),
        subtitleStyle: SkeletonLineStyle(
            height: 12,
            maxLength: 200,
            randomLength: true,
            borderRadius: BorderRadius.circular(12)),
        hasSubtitle: true,
      ),
    );
  }
}
