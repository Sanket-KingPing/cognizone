import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  final String courseName;
  final String language;

  const CoursePage({
    super.key,
    required this.courseName,
    required this.language,
  });

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  int _selectedTopicIndex = 0;
  bool _showRegistrationForm = false;

  // Simulated tutorial topics per language (only 3 shown without register)
  List<Map<String, String>> get _topics {
    return [
      {
        'heading': 'Introduction to ${widget.language}',
        'content': 'Welcome to ${widget.language}!\n\n'
            '${widget.language} is a high-level, general-purpose programming language. '
            'It is widely used in web development, data science, artificial intelligence, and more.\n\n'
            'In this module, you will learn the core concepts, setup your environment, '
            'and write your very first ${widget.language} program.\n\n'
            'Topics covered:\n'
            '• What is ${widget.language}?\n'
            '• History and features\n'
            '• Installing ${widget.language}\n'
            '• Running your first program',
      },
      {
        'heading': '${widget.language} Variables & Data Types',
        'content': 'Understanding Variables in ${widget.language}\n\n'
            'Variables are containers for storing data values. In ${widget.language}, '
            'you do not need to declare a variable type explicitly.\n\n'
            'Data types include:\n'
            '• Integers (int)\n'
            '• Floating-point numbers (float)\n'
            '• Strings (str)\n'
            '• Booleans (bool)\n'
            '• Lists, Tuples, Dictionaries, and Sets\n\n'
            'Example:\n'
            '  name = "Cognizone"\n'
            '  age = 5\n'
            '  is_active = True',
      },
      {
        'heading': 'Control Flow in ${widget.language}',
        'content': 'Control Flow — if, else, and loops\n\n'
            'Control flow allows your program to make decisions and repeat actions.\n\n'
            'Conditionals:\n'
            '  if condition:\n'
            '      do_something()\n'
            '  elif other_condition:\n'
            '      do_other()\n'
            '  else:\n'
            '      fallback()\n\n'
            'Loops:\n'
            '  for i in range(10):\n'
            '      print(i)\n\n'
            '  while condition:\n'
            '      do_something()',
      },
      // Content below requires registration
      {
        'heading': 'Functions in ${widget.language}',
        'content': '🔒 Register to unlock this content.',
      },
      {
        'heading': 'Object-Oriented ${widget.language}',
        'content': '🔒 Register to unlock this content.',
      },
      {
        'heading': 'Modules & Packages',
        'content': '🔒 Register to unlock this content.',
      },
    ];
  }

  bool get _isLocked => _selectedTopicIndex >= 3;

  void _navigateToRegister() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;

        return Scaffold(
          backgroundColor: const Color(0xFFF4F6FA),
          drawer: isMobile
              ? Drawer(
                  child: _buildSidebarContent(),
                )
              : null,
          body: Column(
            children: [
              // ── TOP ROW: Logo | Course Name ──────────────────────────────────
              Container(
                height: isMobile ? null : 100,
                padding:
                    isMobile ? const EdgeInsets.symmetric(vertical: 10) : null,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Company Logo (hidden or shrunk on mobile)
                    if (!isMobile)
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A2342),
                          border: Border(
                            right: BorderSide(color: Colors.grey.shade300),
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Image(
                                image: AssetImage(
                                    'assets/images/CA MAIN Logo.png'),
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Cognizone Academy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    // Course Name + Back button
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 10 : 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (isMobile)
                              Builder(
                                builder: (context) => IconButton(
                                  icon: const Icon(Icons.menu,
                                      color: Color(0xFF0A2342)),
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                ),
                              ),
                            // Back to landing page
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back,
                                  color: Color(0xFF0A2342)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.courseName,
                                    style: TextStyle(
                                      fontSize: isMobile ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF0A2342),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${widget.language} Course',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── BOTTOM ROW: Sidebar | Content ────────────────────────────────
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── LEFT SIDEBAR (desktop only) ───────────────────────────
                    if (!isMobile)
                      Container(
                        width: 220,
                        color: Colors.white,
                        child: _buildSidebarContent(),
                      ),

                    // ── RIGHT CONTENT AREA ────────────────────────────────────
                    Expanded(
                      child: Container(
                        color: const Color(0xFFF4F6FA),
                        child: _showRegistrationForm
                            ? _buildRegistrationForm(isMobile)
                            : (_isLocked
                                ? _buildLockedContent()
                                : _buildTutorialContent(isMobile)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSidebarContent() {
    return Column(
      children: [
        // Topic list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: _topics.length,
            itemBuilder: (context, index) {
              final bool isSelected = _selectedTopicIndex == index;
              final bool locked = index >= 3;

              return InkWell(
                onTap: () {
                  setState(() => _selectedTopicIndex = index);
                  if (MediaQuery.of(context).size.width < 900) {
                    Navigator.pop(context); // close drawer on mobile
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFE8EFF8)
                        : Colors.transparent,
                    border: Border(
                      left: BorderSide(
                        color: isSelected
                            ? const Color(0xFF0A2342)
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (locked)
                        const Icon(Icons.lock, size: 14, color: Colors.grey)
                      else
                        Icon(Icons.circle,
                            size: 8,
                            color: isSelected
                                ? const Color(0xFF0A2342)
                                : Colors.grey.shade400),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _topics[index]['heading']!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: locked
                                ? Colors.grey.shade400
                                : isSelected
                                    ? const Color(0xFF0A2342)
                                    : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // ── REGISTER SECTION ──────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FC),
            border: Border(
              top: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Want to see more?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xFF0A2342),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Register to unlock all topics. Your course and Student ID will be recorded automatically.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() => _showRegistrationForm = true);
                    if (MediaQuery.of(context).size.width < 900) {
                      Navigator.pop(context); // close drawer
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2342),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTutorialContent(bool isMobile) {
    final topic = _topics[_selectedTopicIndex];
    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Text(
            topic['heading']!,
            style: TextStyle(
              fontSize: isMobile ? 22 : 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0A2342),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 30),

          // Content card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 20 : 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              topic['content']!,
              style: const TextStyle(
                fontSize: 15,
                height: 1.8,
                color: Color(0xFF2D3748),
              ),
            ),
          ),

          const SizedBox(height: 30),
          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_selectedTopicIndex > 0)
                OutlinedButton.icon(
                  onPressed: () => setState(
                      () => _selectedTopicIndex = _selectedTopicIndex - 1),
                  icon: const Icon(Icons.arrow_back, size: 16),
                  label: const Text('Previous'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF0A2342),
                    side: const BorderSide(color: Color(0xFF0A2342)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                )
              else
                const SizedBox(),
              if (_selectedTopicIndex < _topics.length - 1)
                ElevatedButton.icon(
                  onPressed: () => setState(
                      () => _selectedTopicIndex = _selectedTopicIndex + 1),
                  icon: const Icon(Icons.arrow_forward, size: 16),
                  label: const Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2342),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLockedContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const Icon(
              Icons.lock_rounded,
              size: 64,
              color: Color(0xFF0A2342),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Content Locked',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2342),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Register to unlock all course materials.\nYour Student ID will be recorded automatically.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () => setState(() => _showRegistrationForm = true),
            icon: const Icon(Icons.app_registration),
            label: const Text(
              'Register Now',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A2342),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegistrationForm(bool isMobile) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width - 40 : 450,
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Course Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2342),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: widget.courseName,
                readOnly: true,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Selected Course',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Student ID',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _navigateToRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A2342),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text('Confirm Registration',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Center(
                child: TextButton(
                  onPressed: () =>
                      setState(() => _showRegistrationForm = false),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
