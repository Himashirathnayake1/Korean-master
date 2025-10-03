import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';
import 'package:korean_master/widgets/common/popup_custom_button.dart';

class BookSelectionPopup extends StatefulWidget {
  final Function(String bookId) onBookSelected;

  const BookSelectionPopup({super.key, required this.onBookSelected});

  @override
  State<BookSelectionPopup> createState() => _BookSelectionPopupState();
}

class _BookSelectionPopupState extends State<BookSelectionPopup> {
  String? selectedBookId;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title text
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: Text(
                'ඔබට වචන පාඩම් කිරීමට අවශ්‍ය පොත තෝරන්න.',
                style: AppTheme.titleSinhala,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 6),

            // EPS Book 01
            _buildBookCard(
              bookId: 'book01',
              title: 'EPS Book 01',
              subtitle: 'දෛනික ජීවිතය කොරියානු භාෂාව',
              isSelected: selectedBookId == 'book01',
            ),

            const SizedBox(height: 8),

            // EPS Book 02
            _buildBookCard(
              bookId: 'book02',
              title: 'EPS Book 02',
              subtitle: 'වැඩ ජීවිතය කොරියානු භාෂාව',
              isSelected: selectedBookId == 'book02',
            ),

            const SizedBox(height: 22),

            // Continue Button
            PopupCustomButton(
              text: 'Continue',
              onPressed:
                  selectedBookId != null
                      ? () {
                        widget.onBookSelected(selectedBookId!);
                      }
                      : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCard({
    required String bookId,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBookId = bookId;
        });
      },
      child: Container(
        width: double.infinity,
        height: 140, // Fixed height to ensure both cards are same size
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7F4BF7) : Colors.white,

          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF7F4BF7),
            width: isSelected ? 1 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            Container(
              alignment: Alignment.centerRight,
              height: 25, 
              child:
                  isSelected
                      ? SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset('assets/icons/correct_blue.png'),
                      )
                      : const SizedBox(
                        width: 25,
                        height: 25,
                      ), // Empty space when not selected
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTheme.subTitleText.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTheme.titleSinhala.copyWith(
                color:
                    isSelected
                        ? Colors.white.withValues(alpha: 0.9)
                        : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
