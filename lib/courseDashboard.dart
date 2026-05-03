import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CourseDashboard(),
    debugShowCheckedModeBanner: false,
  ));
}

class Course {
  final String title;
  final IconData icon;
  final String type;

  Course({required this.title, required this.icon, this.type = "Free"});
}

class CourseDashboard extends StatefulWidget {
  const CourseDashboard({super.key});

  @override
  State<CourseDashboard> createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("My Registered Courses",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: const CourseDashboardContent(),
    );
  }
}

class CourseDashboardContent extends StatefulWidget {
  const CourseDashboardContent({super.key});

  @override
  State<CourseDashboardContent> createState() => _CourseDashboardContentState();
}

class _CourseDashboardContentState extends State<CourseDashboardContent> {
  bool isGridView = true; // Toggle state

  @override
  Widget build(BuildContext context) {
    // Mock data for registered courses
    final List<Course> registeredCourses = [
      // Course(title: "PHP & Laravel", icon: Icons.code),
      // Course(title: "MySQL Database", icon: Icons.storage),
      // Course(title: "Unix Programming", icon: Icons.terminal),
      // Course(title: "Flutter Basics", icon: Icons.mobile_friendly),
      // Course(title: "Computer Networks", icon: Icons.router),
      // Course(title: "Web UI Design", icon: Icons.web),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── VIEW TOGGLE BUTTONS ──────────────────────────────────────────
          Row(
            children: [
              const Text(
                "View Style:",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(width: 15),
              // GRID BUTTON
              GestureDetector(
                onTap: () => setState(() => isGridView = true),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isGridView ? const Color(0xFF76C753) : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isGridView
                          ? const Color(0xFF76C753)
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Icon(Icons.grid_view_rounded,
                      color: isGridView ? Colors.black : Colors.grey.shade600,
                      size: 24),
                ),
              ),
              const SizedBox(width: 10),
              // LIST BUTTON
              GestureDetector(
                onTap: () => setState(() => isGridView = false),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: !isGridView ? const Color(0xFF76C753) : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: !isGridView
                          ? const Color(0xFF76C753)
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Icon(Icons.format_list_bulleted_rounded,
                      color: !isGridView ? Colors.black : Colors.grey.shade600,
                      size: 24),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ── CONTENT AREA ────────────────────────────────────────────────
          Expanded(
            child: isGridView
                ? _buildGridView(registeredCourses)
                : _buildListView(registeredCourses),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<Course> courses) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2;
        if (constraints.maxWidth < 600) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1000) {
          crossAxisCount = 2;
        } else if (constraints.maxWidth < 1400) {
          crossAxisCount = 3;
        } else {
          crossAxisCount = 4;
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        );
      },
    );
  }

  Widget _buildListView(List<Course> courses) {
    return ListView.separated(
      itemCount: courses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final course = courses[index];
        return InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(course.icon, color: Colors.blueAccent),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(course.type,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigation logic goes here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Opening ${course.title}...")),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(course.icon, size: 40, color: Colors.blueAccent),
              ),
              const SizedBox(height: 12),
              // Course Name
              Text(
                course.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              // Type Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  course.type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
