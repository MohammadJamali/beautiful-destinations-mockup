import 'dart:math';

import 'package:beautiful_destinations/models/tiktok.dart';
import 'package:beautiful_destinations/views/constant.dart';
import 'package:beautiful_destinations/views/tiktok/page_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  static const routeName = 'explore';
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final PageController _pageController = PageController();
  late AppLocalizations _localizations;
  late MediaQueryData _mediaQuery;
  late ThemeData _theme;

  late List<Map<String, String>> datasource;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context)!;
    _mediaQuery = MediaQuery.of(context);
    _theme = Theme.of(context);

    final arg = ModalRoute.of(context)!.settings.arguments;

    datasource = List.from(snapList);

    if (arg != null) {
      final item = datasource.where((e) => e['id'] == arg).first;
      datasource.remove(item);
      datasource.insert(0, item);
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: _theme.iconTheme.copyWith(
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: datasource
            .map(
              (e) => TiktokPageView(
                TiktokModel(
                  id: e['id']!,
                  title: e['title']!,
                  thumbnail: e['thumbnail']!,
                  video: e['video']!,
                  description: e['description'],
                  likes: random.nextInt(70) + 10,
                  comments: 5000,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
