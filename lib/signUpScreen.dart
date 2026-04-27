import 'package:flutter/material.dart';

void main() => runApp(const CognizoneApp());

class CognizoneApp extends StatelessWidget {
  const CognizoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cognizone Academy',
      theme: ThemeData(
        primaryColor: const Color(0xFF0A2342),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A2342)),
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  // --- COMPREHENSIVE DATA MAP ---
  final Map<String, List<String>> indiaData = {
    'Andaman and Nicobar Islands': ['Port Blair'],
    'Andhra Pradesh': [
      'Adoni',
      'Amaravati',
      'Anantapur',
      'Chandragiri',
      'Chittoor',
      'Dowlaiswaram',
      'Eluru',
      'Guntur',
      'Kadapa',
      'Kakinada',
      'Kurnool',
      'Machilipatnam',
      'Nagarjunakoṇḍa',
      'Rajahmundry',
      'Srikakulam',
      'Tirupati',
      'Vijayawada',
      'Visakhapatnam',
      'Vizianagaram',
      'Yemmiganur'
    ],
    'Arunachal Pradesh': ['Itanagar'],
    'Assam': [
      'Dhuburi',
      'Dibrugarh',
      'Dispur',
      'Guwahati',
      'Jorhat',
      'Nagaon',
      'Sivasagar',
      'Silchar',
      'Tezpur',
      'Tinsukia'
    ],
    'Bihar': [
      'Ara',
      'Barauni',
      'Begusarai',
      'Bettiah',
      'Bhagalpur',
      'Bihar Sharif',
      'Bodh Gaya',
      'Buxar',
      'Chapra',
      'Darbhanga',
      'Dehri',
      'Dinapur Nizamat',
      'Gaya',
      'Hajipur',
      'Jamalpur',
      'Katihar',
      'Madhubani',
      'Motihari',
      'Munger',
      'Muzaffarpur',
      'Patna',
      'Purnia',
      'Pusa',
      'Saharsa',
      'Samastipur',
      'Sasaram',
      'Sitamarhi',
      'Siwan'
    ],
    'Chandigarh': ['Chandigarh'],
    'Chhattisgarh': [
      'Ambikapur',
      'Bhilai',
      'Bilaspur',
      'Dhamtari',
      'Durg',
      'Jagdalpur',
      'Raipur',
      'Rajnandgaon'
    ],
    'Dadra and Nagar Haveli and Daman and Diu': ['Daman', 'Diu', 'Silvassa'],
    'Delhi': ['Delhi', 'New Delhi'],
    'Goa': ['Madgaon', 'Panaji'],
    'Gujarat': [
      'Ahmadabad',
      'Amreli',
      'Bharuch',
      'Bhavnagar',
      'Bhuj',
      'Dwarka',
      'Gandhinagar',
      'Godhra',
      'Jamnagar',
      'Junagadh',
      'Kandla',
      'Khambhat',
      'Kheda',
      'Mahesana',
      'Morbi',
      'Nadiad',
      'Navsari',
      'Okha',
      'Palanpur',
      'Patan',
      'Porbandar',
      'Rajkot',
      'Surat',
      'Surendranagar',
      'Valsad',
      'Veraval'
    ],
    'Haryana': [
      'Ambala',
      'Bhiwani',
      'Chandigarh',
      'Faridabad',
      'Firozpur Jhirka',
      'Gurugram',
      'Hansi',
      'Hisar',
      'Jind',
      'Kaithal',
      'Karnal',
      'Kurukshetra',
      'Panipat',
      'Pehowa',
      'Rewari',
      'Rohtak',
      'Sirsa',
      'Sonipat'
    ],
    'Himachal Pradesh': [
      'Bilaspur',
      'Chamba',
      'Dalhousie',
      'Dharmshala',
      'Hamirpur',
      'Kangra',
      'Kullu',
      'Mandi',
      'Nahan',
      'Shimla',
      'Una'
    ],
    'Jammu and Kashmir': [
      'Anantnag',
      'Baramula',
      'Doda',
      'Gulmarg',
      'Jammu',
      'Kathua',
      'Punch',
      'Rajouri',
      'Srinagar',
      'Udhampur'
    ],
    'Jharkhand': [
      'Bokaro',
      'Chaibasa',
      'Deoghar',
      'Dhanbad',
      'Dumka',
      'Giridih',
      'Hazaribag',
      'Jamshedpur',
      'Jharia',
      'Rajmahal',
      'Ranchi',
      'Saraikela'
    ],
    'Karnataka': [
      'Badami',
      'Ballari',
      'Bengaluru',
      'Belagavi',
      'Bhadravati',
      'Bidar',
      'Chikkamagaluru',
      'Chitradurga',
      'Davangere',
      'Halebid',
      'Hassan',
      'Hubballi-Dharwad',
      'Kalaburagi',
      'Kolar',
      'Madikeri',
      'Mandya',
      'Mangaluru',
      'Mysuru',
      'Raichur',
      'Shivamogga',
      'Shravanabelagola',
      'Shrirangapattana',
      'Tumakuru',
      'Vijayapura'
    ],
    'Kerala': [
      'Alappuzha',
      'Vatakara',
      'Idukki',
      'Kannur',
      'Kochi',
      'Kollam',
      'Kottayam',
      'Kozhikode',
      'Mattancheri',
      'Palakkad',
      'Thalassery',
      'Thiruvananthapuram',
      'Thrissur'
    ],
    'Ladakh': ['Kargil', 'Leh'],
    'Madhya Pradesh': [
      'Balaghat',
      'Barwani',
      'Betul',
      'Bharhut',
      'Bhind',
      'Bhojpur',
      'Bhopal',
      'Burhanpur',
      'Chhatarpur',
      'Chhindwara',
      'Damoh',
      'Datia',
      'Dewas',
      'Dhar',
      'Dr. Ambedkar Nagar (Mhow)',
      'Guna',
      'Gwalior',
      'Hoshangabad',
      'Indore',
      'Itarsi',
      'Jabalpur',
      'Jhabua',
      'Khajuraho',
      'Khandwa',
      'Khargone',
      'Maheshwar',
      'Mandla',
      'Mandsaur',
      'Morena',
      'Murwara',
      'Narsimhapur',
      'Narsinghgarh',
      'Narwar',
      'Neemuch',
      'Nowgong',
      'Orchha',
      'Panna',
      'Raisen',
      'Rajgarh',
      'Ratlam',
      'Rewa',
      'Sagar',
      'Sarangpur',
      'Satna',
      'Sehore',
      'Seoni',
      'Shahdol',
      'Shajapur',
      'Sheopur',
      'Shivpuri',
      'Ujjain',
      'Vidisha'
    ],
    'Maharashtra': [
      'Ahmadnagar',
      'Akola',
      'Amravati',
      'Aurangabad',
      'Bhandara',
      'Bhusawal',
      'Bid',
      'Buldhana',
      'Chandrapur',
      'Daulatabad',
      'Dhule',
      'Jalgaon',
      'Kalyan',
      'Karli',
      'Kolhapur',
      'Mahabaleshwar',
      'Malegaon',
      'Matheran',
      'Mumbai',
      'Nagpur',
      'Nanded',
      'Nashik',
      'Osmanabad',
      'Pandharpur',
      'Parbhani',
      'Pune',
      'Ratnagiri',
      'Sangli',
      'Satara',
      'Sevagram',
      'Solapur',
      'Thane',
      'Ulhasnagar',
      'Vasai-Virar',
      'Wardha',
      'Yavatmal'
    ],
    'Manipur': ['Imphal'],
    'Meghalaya': ['Cherrapunji', 'Shillong'],
    'Mizoram': ['Aizawl', 'Lunglei'],
    'Nagaland': ['Kohima', 'Mon', 'Phek', 'Wokha', 'Zunheboto'],
    'Odisha': [
      'Balangir',
      'Baleshwar',
      'Baripada',
      'Bhubaneshwar',
      'Brahmapur',
      'Cuttack',
      'Dhenkanal',
      'Kendujhar',
      'Konark',
      'Koraput',
      'Paradip',
      'Phulabani',
      'Puri',
      'Sambalpur',
      'Udayagiri'
    ],
    'Puducherry': ['Karaikal', 'Mahe', 'Puducherry', 'Yanam'],
    'Punjab': [
      'Amritsar',
      'Batala',
      'Chandigarh',
      'Faridkot',
      'Firozpur',
      'Gurdaspur',
      'Hoshiarpur',
      'Jalandhar',
      'Kapurthala',
      'Ludhiana',
      'Nabha',
      'Patiala',
      'Rupnagar',
      'Sangrur'
    ],
    'Rajasthan': [
      'Abu',
      'Ajmer',
      'Alwar',
      'Amer',
      'Barmer',
      'Beawar',
      'Bharatpur',
      'Bhilwara',
      'Bikaner',
      'Bundi',
      'Chittaurgarh',
      'Churu',
      'Dhaulpur',
      'Dungarpur',
      'Ganganagar',
      'Hanumangarh',
      'Jaipur',
      'Jaisalmer',
      'Jalor',
      'Jhalawar',
      'Jhunjhunu',
      'Jodhpur',
      'Kishangarh',
      'Kota',
      'Merta',
      'Nagaur',
      'Nathdwara',
      'Pali',
      'Phalodi',
      'Pushkar',
      'Sawai Madhopur',
      'Shahpura',
      'Sikar',
      'Sirohi',
      'Tonk',
      'Udaipur'
    ],
    'Sikkim': ['Gangtok', 'Gyalshing', 'Lachung', 'Mangan'],
    'Tamil Nadu': [
      'Arcot',
      'Chengalpattu',
      'Chennai',
      'Chidambaram',
      'Coimbatore',
      'Cuddalore',
      'Dharmapuri',
      'Dindigul',
      'Erode',
      'Kanchipuram',
      'Kanniyakumari',
      'Kodaikanal',
      'Kumbakonam',
      'Madurai',
      'Mamallapuram',
      'Nagappattinam',
      'Nagercoil',
      'Palayamkottai',
      'Pudukkottai',
      'Rajapalayam',
      'Ramanathapuram',
      'Salem',
      'Thanjavur',
      'Tiruchchirappalli',
      'Tirunelveli',
      'Tiruppur',
      'Thoothukudi',
      'Udhagamandalam',
      'Vellore'
    ],
    'Telangana': [
      'Hyderabad',
      'Karimnagar',
      'Khammam',
      'Mahbubnagar',
      'Nizamabad',
      'Sangareddi',
      'Warangal'
    ],
    'Tripura': ['Agartala'],
    'Uttar Pradesh': [
      'Agra',
      'Aligarh',
      'Amroha',
      'Ayodhya',
      'Azamgarh',
      'Bahraich',
      'Ballia',
      'Banda',
      'Bara Banki',
      'Bareilly',
      'Basti',
      'Bijnor',
      'Bithur',
      'Budaun',
      'Bulandshahr',
      'Deoria',
      'Etah',
      'Etawah',
      'Faizabad',
      'Farrukhabad-cum-Fatehgarh',
      'Fatehpur',
      'Fatehpur Sikri',
      'Ghaziabad',
      'Ghazipur',
      'Gonda',
      'Gorakhpur',
      'Hamirpur',
      'Hardoi',
      'Hathras',
      'Jalaun',
      'Jaunpur',
      'Jhansi',
      'Kannauj',
      'Kanpur',
      'Lakhimpur',
      'Lalitpur',
      'Lucknow',
      'Mainpuri',
      'Mathura',
      'Meerut',
      'Mirzapur-Vindhyachal',
      'Moradabad',
      'Muzaffarnagar',
      'Partapgarh',
      'Pilibhit',
      'Prayagraj',
      'Rae Bareli',
      'Rampur',
      'Saharanpur',
      'Sambhal',
      'Shahjahanpur',
      'Sitapur',
      'Sultanpur',
      'Tehri',
      'Varanasi'
    ],
    'Uttarakhand': [
      'Almora',
      'Dehra Dun',
      'Haridwar',
      'Mussoorie',
      'Nainital',
      'Pithoragarh'
    ],
    'West Bengal': [
      'Alipore',
      'Alipur Duar',
      'Asansol',
      'Baharampur',
      'Bally',
      'Balurghat',
      'Bankura',
      'Baranagar',
      'Barasat',
      'Barrackpore',
      'Basirhat',
      'Bhatpara',
      'Bishnupur',
      'Budge Budge',
      'Burdwan',
      'Chandernagore',
      'Darjeeling',
      'Diamond Harbour',
      'Dum Dum',
      'Durgapur',
      'Halisahar',
      'Haora',
      'Hugli',
      'Ingraj Bazar',
      'Jalpaiguri',
      'Kalimpong',
      'Kamarhati',
      'Kanchrapara',
      'Kharagpur',
      'Cooch Behar',
      'Kolkata',
      'Krishnanagar',
      'Malda',
      'Midnapore',
      'Murshidabad',
      'Nabadwip',
      'Palashi',
      'Panihati',
      'Purulia',
      'Raiganj',
      'Santipur',
      'Shantiniketan',
      'Shrirampur',
      'Siliguri',
      'Siuri',
      'Tamluk',
      'Titagarh'
    ],
  };

  String? selectedCountry = "India";
  String? selectedState;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          if (isMobile) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // TOP SIDE — Background Image
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // BOTTOM SIDE — Forms
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Toggle Switch
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => setState(() => isLogin = true),
                              child: Text("LOGIN",
                                  style: TextStyle(
                                    fontWeight: isLogin
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isLogin
                                        ? const Color(0xFF0A2342)
                                        : Colors.grey,
                                    fontSize: 18,
                                  )),
                            ),
                            const Text("|",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 18)),
                            TextButton(
                              onPressed: () => setState(() => isLogin = false),
                              child: Text("SIGN IN",
                                  style: TextStyle(
                                    fontWeight: !isLogin
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: !isLogin
                                        ? const Color(0xFF0A2342)
                                        : Colors.grey,
                                    fontSize: 18,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        isLogin ? _buildLoginForm() : _buildSignInForm(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Row(
              children: [
                // LEFT SIDE — Background Image
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // RIGHT SIDE — Forms
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            // Toggle Switch
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      setState(() => isLogin = true),
                                  child: Text("LOGIN",
                                      style: TextStyle(
                                        fontWeight: isLogin
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isLogin
                                            ? const Color(0xFF0A2342)
                                            : Colors.grey,
                                        fontSize: 18,
                                      )),
                                ),
                                const Text("|",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18)),
                                TextButton(
                                  onPressed: () =>
                                      setState(() => isLogin = false),
                                  child: Text("SIGN IN",
                                      style: TextStyle(
                                        fontWeight: !isLogin
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: !isLogin
                                            ? const Color(0xFF0A2342)
                                            : Colors.grey,
                                        fontSize: 18,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            isLogin ? _buildLoginForm() : _buildSignInForm(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        _buildTextField("Email", Icons.email),
        const SizedBox(height: 20),
        _buildTextField("Password", Icons.lock, isPassword: true),
        const SizedBox(height: 30),
        _buildActionButton("Login"),
        const SizedBox(height: 15),
        TextButton(onPressed: () {}, child: const Text("Forgot Password?")),
      ],
    );
  }

  Widget _buildSignInForm() {
    bool isVeryMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      children: [
        if (isVeryMobile) ...[
          _buildTextField("Full Name", Icons.person),
          const SizedBox(height: 20),
          _buildTextField("Email ID", Icons.email),
        ] else
          Row(
            children: [
              Expanded(child: _buildTextField("Full Name", Icons.person)),
              const SizedBox(width: 15),
              Expanded(child: _buildTextField("Email ID", Icons.email)),
            ],
          ),
        const SizedBox(height: 20),
        _buildTextField("Date of Birth (DD-MM-YYYY)", Icons.calendar_month),
        const SizedBox(height: 20),

        // Country Selection
        _buildDropdown("Country", ["India"], selectedCountry,
            (val) => setState(() => selectedCountry = val)),
        const SizedBox(height: 20),

        // State & City Row
        if (isVeryMobile) ...[
          _buildDropdown(
              "State/UT",
              indiaData.keys.toList()..sort(),
              selectedState,
              (val) => setState(() {
                    selectedState = val;
                    selectedCity = null;
                  })),
          const SizedBox(height: 20),
          _buildDropdown(
              "City",
              selectedState == null
                  ? []
                  : (indiaData[selectedState!]!..sort()),
              selectedCity,
              (val) => setState(() => selectedCity = val)),
        ] else
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                    "State/UT",
                    indiaData.keys.toList()..sort(),
                    selectedState,
                    (val) => setState(() {
                          selectedState = val;
                          selectedCity = null;
                        })),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildDropdown(
                    "City",
                    selectedState == null
                        ? []
                        : (indiaData[selectedState!]!..sort()),
                    selectedCity,
                    (val) => setState(() => selectedCity = val)),
              ),
            ],
          ),
        const SizedBox(height: 40),
        _buildActionButton("Sign Up"),
      ],
    );
  }

  // --- REUSABLE WIDGETS ---

  Widget _buildTextField(String label, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF0A2342)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF0A2342), width: 2),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      hint: Text(label),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
      items: items
          .map((e) => DropdownMenuItem(
              value: e, child: Text(e, style: const TextStyle(fontSize: 13))))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildActionButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0A2342),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
