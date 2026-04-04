import 'package:flutter/material.dart';

/// Bottom input row: attachment, text field, send — for [Scaffold.bottomNavigationBar].
class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
    this.onAttachment,
    this.hintText = 'Message',
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onAttachment;
  final String hintText;

  static const Color _violet = Color(0xFF7F7BFF);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: const Color(0xFFFAFAF8),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (onAttachment != null) ...[
                IconButton(
                  onPressed: onAttachment,
                  icon: Icon(
                    Icons.attach_file_rounded,
                    color: Colors.grey.shade700,
                  ),
                  tooltip: 'Attach',
                ),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black38,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: _violet, width: 1.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: onSend,
                style: IconButton.styleFrom(
                  backgroundColor: _violet,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.send_rounded, size: 22),
                tooltip: 'Send',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
