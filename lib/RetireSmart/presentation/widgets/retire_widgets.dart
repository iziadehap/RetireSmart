import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final int delay;
  const FadeIn({super.key, required this.child, required this.delay});
  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _translate = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _translate,
      child: FadeTransition(opacity: _opacity, child: widget.child),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ',';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (oldValue.text.length > newValue.text.length) {
      final oldSelectionEnd = oldValue.selection.end;
      if (oldValue.text.substring(oldSelectionEnd - 1, oldSelectionEnd) ==
          separator) {
        final newText =
            oldValue.text.substring(0, oldSelectionEnd - 2) +
            oldValue.text.substring(oldSelectionEnd);
        return _format(newText, oldValue);
      }
    }

    return _format(newValue.text, oldValue);
  }

  TextEditingValue _format(String text, TextEditingValue oldValue) {
    String cleanText = text.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanText.isEmpty) return oldValue.copyWith(text: '');

    final number = int.tryParse(cleanText);
    if (number == null) return oldValue;

    final result = NumberFormat('#,###').format(number);

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}
