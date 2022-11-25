import 'package:cred_progress_bar/src/thumb.dart';
import 'package:flutter/material.dart';

class CredProgressBar extends StatefulWidget {
  const CredProgressBar({
    super.key,
    this.barWidth = double.maxFinite,
    this.barHeight = 16,
    required this.controller,
    required this.barColor,
    this.thumbColor = Colors.amber,
    this.thumbWidth = 14,
  });

  final Color barColor;
  final double barHeight;
  final double barWidth;
  final ScrollController controller;
  final Color thumbColor;
  final double thumbWidth;

  @override
  State<CredProgressBar> createState() => _CredProgressBarState();
}

class _CredProgressBarState extends State<CredProgressBar> {
  double _bar1Position = 0;
  double _bar2Position = 0;
  double _bar3Position = 0;
  final BorderRadius _barBorderRadius = BorderRadius.circular(80);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller.hasClients) {
      _controller.addListener(_scrollListener);
    }
  }

  double get _barWidth => widget.barWidth;

  ///? Bar 1
  double get _bar1Width => _barWidth * 0.7;

  ///? Bar 2
  double get _bar2Width => _barWidth * 0.5;

  ///? Bar 3
  double get _bar3Width => _barWidth * 0.3;

  double get _thumbWidth => widget.thumbWidth;

  ScrollController get _controller => widget.controller;

  /// Calculates the thumb position
  double _thumbPosition(double maxExtent, double currentPos, double width) {
    final mWidth = _barWidth - width;
    return (mWidth / (maxExtent / currentPos)).clamp(0, mWidth);
  }

  /// This function dynamic calculates the width of the thumb
  /// based on the scroll position.
  /// if it goes above or beyond the scroll extent, then we will
  /// reduce the size to mimic the fluid animation.
  double _dynamicThumbWidth(double width) {
    try {
      if (_controller.hasClients) {
        final minScroll = _controller.position.minScrollExtent;
        final maxScroll = _controller.position.maxScrollExtent;
        if (_controller.position.pixels <= minScroll) {
          final currentPos = _controller.position.pixels;

          /// 15% of the scroll extent will be taken
          /// if a user dragged the scroll view to lets say
          /// 2500px where max scroll extent is 2300px
          /// (can happen in [BouncingScrollPhysics])
          /// then the 15% of extra 200 px will be removed from the thumb
          /// width, which in UI shows as its shrinking with user scroll
          /// thus mimics like fluid animation.
          final mWidth = width - ((currentPos - minScroll).abs() * 0.15);
          return mWidth.clamp(_thumbWidth * 2, width);
        } else if (_controller.position.pixels >= maxScroll) {
          final currentPos = _controller.position.pixels;
          final mWidth = width - ((currentPos - maxScroll).abs() * 0.15);
          return mWidth.clamp(_thumbWidth * 2, width);
        }
      }
      return width;
    } catch (e) {
      return width;
    }
  }

  /// The amount of angle & speed at which thumb rotates
  double _thumbAngle() {
    if (_thumbMargin(_bar3Width) != 0) {
      return (_bar3Position + _thumbMargin(_bar3Width)) / 15;
    } else {
      return (_bar3Position + _dynamicThumbWidth(_bar3Width)) / 15;
    }
  }

  double _thumbMargin(double width) {
    return _controller.position.pixels > 0
        ? width - _dynamicThumbWidth(width)
        : 0;
  }

  /// Updates the bar's positions in progress bar
  void _scrollListener() {
    final maxExtent = _controller.position.maxScrollExtent;
    final currentPos = _controller.position.pixels;
    _bar1Position = _thumbPosition(maxExtent, currentPos, _bar1Width);
    _bar2Position = _thumbPosition(maxExtent, currentPos, _bar2Width);
    _bar3Position = _thumbPosition(maxExtent, currentPos, _bar3Width);
    setState(() {});
  }

  Widget _mainSliderBar() {
    return Container(
      width: _barWidth,
      height: widget.barHeight,
      decoration: BoxDecoration(
        borderRadius: _barBorderRadius,
        border: Border.all(color: widget.barColor.withOpacity(0.3), width: 1.2),
      ),
    );
  }

  Widget _nesterSliderBar({
    required double thumbPos,
    required double barWidth,
    required Color barColor,
    Widget? child,
  }) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      left: thumbPos,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: barColor, width: 1.2),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.only(left: _thumbMargin(barWidth)),
        width: _dynamicThumbWidth(barWidth),
        height: widget.barHeight,
        child: child,
      ),
    );
  }

  Center _thumbWidget() {
    return Center(
      child: Transform.rotate(
        angle: _thumbAngle(),
        child: CredThumb(
          width: _thumbWidth,
          height: widget.barHeight,
          color: widget.thumbColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.hasClients) {
      return ClipRRect(
        borderRadius: _barBorderRadius,
        child: Stack(
          children: [
            _mainSliderBar(),
            _nesterSliderBar(
              thumbPos: _bar1Position,
              barWidth: _bar1Width,
              barColor: widget.barColor.withOpacity(0.4),
            ),
            _nesterSliderBar(
              thumbPos: _bar2Position,
              barWidth: _bar2Width,
              barColor: widget.barColor.withOpacity(0.6),
            ),
            _nesterSliderBar(
              thumbPos: _bar3Position,
              barWidth: _bar3Width,
              barColor: widget.barColor.withOpacity(0.8),
              child: _thumbWidget(),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: const [
          Icon(Icons.info_outline),
          SizedBox(height: 16),
          Text('ScrollController has no clients'),
        ],
      );
    }
  }
}
