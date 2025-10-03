import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              normalIcon: 'assets/icons/word.svg',
              selectedIcon: 'assets/icons/word_selected.svg',
              label: 'Words',
            ),
            _buildNavItem(
              index: 1,
              normalIcon: 'assets/icons/review.svg',
              selectedIcon: 'assets/icons/review_selected.svg',
              label: 'Review',
            ),
            _buildNavItem(
              index: 2,
              normalIcon: 'assets/icons/profile.svg',
              selectedIcon: 'assets/icons/profile_selected.svg',
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String normalIcon,
    required String selectedIcon,
    required String label,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? selectedIcon : normalIcon,
              width: 24,
              height: 24,
            
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color:
                    isSelected
                        ? const Color(0xFF7F4BF7)
                        : const Color(0xFFC9C9C9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
