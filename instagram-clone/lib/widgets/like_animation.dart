import 'package:flutter/cupertino.dart';

class LikeAnimationState extends StatefulWidget {
  const LikeAnimationState({
    super.key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
    this.smallLike = false,
  });
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallLike;

  @override
  State<LikeAnimationState> createState() => _LikeAnimationStateState();
}

class _LikeAnimationStateState extends State<LikeAnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.duration.inMilliseconds ~/ 2,
        ));

    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
