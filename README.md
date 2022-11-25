<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Cred like progress bar written in dart for flutter

[![license](https://img.shields.io/github/license/MohanSaiManthri/cred_progress_bar?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQEAQAAADlauupAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAABgAAAAYADwa0LPAAAAB3RJTUUH5QgMBTIvsJF/KwAAAAJiS0dEAACqjSMyAAAA6klEQVQ4y53TrwrCUBTH8cWNJatgVJF1weCf4DuIQebqlowKewqD2YcQ38GwB9jAIJoMrk1Qzle2C4rN469/zrnncK5l/RGwbeh0rP/wcAhZBiLqIhBF8HxSJU3LlyhwHIPvw+0GjwfS7yvwaoXMZnA8QhBAGP6OK1gmzw2OY0XnXg+KgneWSwWu1+F8NvB+h/lcgR0HDofKyvWKDAaKmVstWCwMThKk0VB0nk7N0jYbU8R1f4TtNux2sN3Cel1tW5pNxbyn02fTZZHJRDFzt8tX9nvlfY9GH3y5gOcpC9RqyHhsjsZxtL/zBX3z7zeyXyFwAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTA4LTEyVDA1OjUwOjQ3KzAwOjAwP4besgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wOC0xMlQwNTo1MDo0NyswMDowME7bZg4AAAAASUVORK5CYII=)](https://github.com/MohanSaiManthri/cred_progress_bar/blob/master/LICENSE)
[![pub.dev](https://img.shields.io/pub/v/cred_progress_bar?label=pub.dev&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAQAAAC1QeVaAAAABGdBTUEAALGPC%2FxhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA%2F4ePzL8AAAAHdElNRQflCAwFLhzpNkNgAAAAAW9yTlQBz6J3mgAAATFJREFUGNNN0M0qhGEYh%2FHrft73NaZoImNKkYUFCxt7KdYWFiymKKfgCBTHYMshWFkppVijJp81skBMM9P4SN557r8FC9f2t7sM4IN3SqhgUwxYSxe4KAIBvskoo7JN63XryN7C1JdF2oB1KOAhmWMoXNkHhuKkXxbqOQETEBdsyWatjAMo93PbC%2FsRuuQVP1bVV9XWX37vj7Gaw435tlzLwtfV%2BsMnb6rha3QX9SrXivjHn16X4kGweYYQgGO7bNAGiji5EbSjQwIShsOufrlPHSPZbPqJVfyhXft0A5Izvdic9dPUc7KJtb4PvJykaZ9lMRLTM70wQ4%2FdWYNBclTxse510ks%2FkQ5ZthbeODKoMUEXjYSRUEtjXlSJHhvuPY3Y7%2FgOJTSajofoCDI92m3ODyeBsv3LZ4DoAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTA4LTEyVDA1OjQ2OjI4KzAwOjAwwzEIWwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wOC0xMlQwNTo0NjoyOCswMDowMLJssOcAAAAASUVORK5CYII%3D&logoColor=green)](https://pub.dartlang.org/packages/cred_progress_bar)

## Showcase

![screen-20221125-114041_5_AdobeExpress](https://user-images.githubusercontent.com/36568937/203954734-0b14b73f-86fe-48fc-bef1-a69334b0da1b.gif)

![screen-20221125-115431_2_AdobeExpress](https://user-images.githubusercontent.com/36568937/203957729-58d6de11-18f1-48d2-882c-a45b70f4a8f5.gif)

Get wonderful cred like progress bar for your horizontal list view with minimal efforts

## Getting Started

In your flutter project add the dependency:

```yaml
dependencies:
  cred_progress_bar: ^0.0.1
```

## Usage

```dart
import 'package:cred_progress_bar/cred_progress_bar.dart';
```

```dart
 CredProgressBar(
   controller: _scrollController,
   barWidth: 120,
   thumbWidth: 12,
   barHeight: 14,
   barColor: Colors.amber,
   thumbColor: Colors.purple.shade300,
);
```

> Note: Don't forgot to add `BouncingScrollPhysics` to your listView. This is required to get bouncy fluid animation

### ListView Example

```dart
ListView.builder(
  physics: const BouncingScrollPhysics(), // add this to get fluid animation
  scrollDirection: Axis.horizontal,
  controller: _scrollController,
);
```

### Thanks for using my package 🙏
