import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halcyon/ui/layout/vert_counselor.dart';

class H_BBlocItem {
  final void Function() onPressed;
  final IconData child;
  final Color activeColor;
  final Color inactiveColor;
  final Color childActiveColor;
  final Color childInactiveColor;

  const H_BBlocItem(
      {required this.onPressed,
      required this.childActiveColor,
      required this.childInactiveColor,
      required this.child,
      required this.activeColor,
      required this.inactiveColor});
}

class H_BBlocContainer extends StatelessWidget {
  final List<H_BBlocItem> children;

  const H_BBlocContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: H_VerticalAppLayoutCounselor.BBLOC_ITEM_SIZE +
          (H_VerticalAppLayoutCounselor
                  .BBLOC_CONTAINER_TO_ITEM_PADDING *
              2),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (H_BBlocItem c in children)
              Padding(
                padding: const EdgeInsets.only(
                    top: H_VerticalAppLayoutCounselor
                        .BBLOC_CONTAINER_TO_ITEM_PADDING,
                    bottom: H_VerticalAppLayoutCounselor
                        .BBLOC_CONTAINER_TO_ITEM_PADDING,
                    right: H_VerticalAppLayoutCounselor
                            .BBLOC_CONTAINER_TO_ITEM_PADDING /
                        2),
                child: SizedBox.square(
                    dimension:
                        H_VerticalAppLayoutCounselor.BBLOC_ITEM_SIZE,
                    child: _BBlocItem(c: c)),
              ),
          ],
        ),
      ),
    );
  }
}

class _BBlocItem extends StatefulWidget {
  const _BBlocItem({
    required this.c,
  });

  final H_BBlocItem c;

  @override
  State<_BBlocItem> createState() => _BBlocItemState();
}

class _BBlocItemState extends State<_BBlocItem> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: MouseRegion(
          onEnter: (PointerEnterEvent _) =>
              setState(() => active = true),
          onExit: (PointerExitEvent _) =>
              setState(() => active = false),
          child: GestureDetector(
              onTap: widget.c.onPressed,
              child: AnimatedCrossFade(
                crossFadeState: active
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 165),
                firstChild: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: widget.c.activeColor),
                    child: Icon(widget.c.child,
                        color: widget.c.childActiveColor,
                        size: H_VerticalAppLayoutCounselor
                            .BBLOC_ITEM_ICON_SIZE)),
                secondChild: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: widget.c.inactiveColor),
                    child: Icon(widget.c.child,
                        color: widget.c.childInactiveColor,
                        size: H_VerticalAppLayoutCounselor
                            .BBLOC_ITEM_ICON_SIZE)),
              )),
        ));
  }
}
