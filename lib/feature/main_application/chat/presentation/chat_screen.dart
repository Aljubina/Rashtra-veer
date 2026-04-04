import 'package:flutter/material.dart';

import 'widgets/chat_input_field.dart';
import 'widgets/message_bubble.dart';

/// One-to-one chat UI with dummy messages (no backend).
class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.title,
    this.showOnline = true,
  });

  /// Display name of the other participant (e.g. coach name).
  final String title;
  final bool showOnline;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatMessage {
  const _ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });

  final String text;
  final bool isMe;
  final String timestamp;
}

class _ChatScreenState extends State<ChatScreen> {
  static const Color _screenBg = Color(0xFFFAFAF8);
  static const Color _violetTint = Color(0xFFE9E7FF);
  static const Color _violetAccent = Color(0xFF5F55E7);
  static const Color _titleColor = Color(0xFF21212E);

  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  /// Newest-first for [ListView.reverse].
  late List<_ChatMessage> _messages;

  static List<_ChatMessage> _initialMessages() {
    return const [
      _ChatMessage(
        text: 'Sounds good. See you at the session!',
        isMe: true,
        timestamp: '9:52 AM',
      ),
      _ChatMessage(
        text: "Let's review your squat form in tomorrow's check-in.",
        isMe: false,
        timestamp: '9:48 AM',
      ),
      _ChatMessage(
        text: "Thanks! I've been consistent with the meal plan.",
        isMe: true,
        timestamp: '9:20 AM',
      ),
      _ChatMessage(
        text: 'Your macro ratios look solid this week. Nice work.',
        isMe: false,
        timestamp: '9:15 AM',
      ),
      _ChatMessage(
        text: "Noted — I'll log water in the app after each meal.",
        isMe: true,
        timestamp: '9:02 AM',
      ),
      _ChatMessage(
        text: 'Remember to hydrate — aim for 2.5L today.',
        isMe: false,
        timestamp: '8:46 AM',
      ),
      _ChatMessage(
        text: 'Yes, just finished my warm-up and mobility drills.',
        isMe: true,
        timestamp: '8:36 AM',
      ),
      _ChatMessage(
        text: 'Good morning! Ready for today\'s training block?',
        isMe: false,
        timestamp: '8:30 AM',
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _messages = _initialMessages();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToLatest());
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToLatest() {
    if (!_scrollController.hasClients) return;
    _scrollController.jumpTo(0);
  }

  String _initialsFromName(String value) {
    final parts =
        value.trim().split(RegExp(r'\s+')).where((part) => part.isNotEmpty);
    final initials = parts.take(2).map((part) => part[0]).join();
    return initials.isEmpty ? '?' : initials.toUpperCase();
  }

  void _send() {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;

    final now = TimeOfDay.now();
    final label =
        '${now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod}:${now.minute.toString().padLeft(2, '0')} ${now.period == DayPeriod.am ? 'AM' : 'PM'}';

    setState(() {
      _messages.insert(
        0,
        _ChatMessage(text: text, isMe: true, timestamp: label),
      );
      _inputController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToLatest());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _screenBg,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: _screenBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: _titleColor,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: _violetTint,
              child: Text(
                _initialsFromName(widget.title),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: _violetAccent,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: _titleColor,
                    ),
                  ),
                  if (widget.showOnline)
                    Text(
                      'Online',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: const Color(0xFF2E7D32),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          controller: _scrollController,
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            final m = _messages[index];
            return MessageBubble(
              text: m.text,
              isMe: m.isMe,
              timestamp: m.timestamp,
            );
          },
        ),
      ),
      bottomNavigationBar: ChatInputField(
        controller: _inputController,
        onSend: _send,
      ),
    );
  }
}
