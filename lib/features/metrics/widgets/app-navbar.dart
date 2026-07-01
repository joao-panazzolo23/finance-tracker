import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.icons
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0xFF1D1D1F),
            borderRadius: BorderRadius.circular(36),
            boxShadow: const [
              BoxShadow(
                blurRadius: 30,
                offset: Offset(0, 10),
                color: Colors.black26,
              ),
            ],
          ),
          child: Row(
            children: List.generate(icons.length, (index) {
              final selected = index == selectedIndex;

              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(36),
                  onTap: () => onTap(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    alignment: Alignment.center,
                    child: AnimatedScale(
                      scale: selected ? 1.15 : 1,
                      duration: const Duration(milliseconds: 220),
                      child: Icon(
                        icons[index],
                        size: 28,
                        color: selected
                            ? Colors.white
                            : Colors.white54,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}