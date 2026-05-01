import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../sections/all_sections.dart';
import 'section_model.dart';

class KitModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final IconData icon;
  final List<LessonModel> lessons;
  final int totalLessons;

  const KitModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.icon,
    required this.lessons,
    required this.totalLessons,
  });

  /// Sections are populated lazily from the per-kit seed files via
  /// `sectionsForKit(id)`. Kept off the constructor so the static `startupKits`
  /// list stays `const`-friendly for the lessons part.
  List<SectionModel> get sections => sectionsForKit(id);
}

class LessonModel {
  final String id;
  final String title;
  final String content;
  final String duration;
  final LessonType type;
  final List<String> keyPoints;

  const LessonModel({
    required this.id,
    required this.title,
    required this.content,
    required this.duration,
    required this.type,
    required this.keyPoints,
  });
}

enum LessonType { reading, video, template, quiz }

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// ── Static Data ──────────────────────────────────────────────────────────────

final List<KitModel> startupKits = [
  KitModel(
    id: 'formation',
    title: 'Formation Kit',
    subtitle: 'Build Your Foundation',
    description:
        'Set up your company structure, define your vision, build your org chart, and get your licenses in order.',
    color: AppColors.kitFormation,
    icon: Icons.business_center_rounded,
    totalLessons: 6,
    lessons: [
      LessonModel(
        id: 'f1',
        title: 'Vision & Mission',
        content:
            'A clear vision and mission are the compass of your startup. Your **vision** is the long-term dream — where you want to be in 10 years. Your **mission** is how you get there day-to-day.\n\nA strong vision statement answers: "What change do we want to create in the world?"\nA strong mission statement answers: "What do we do, for whom, and why?"',
        duration: '5 min',
        type: LessonType.reading,
        keyPoints: [
          'Vision = long-term aspirational goal',
          'Mission = daily purpose and direction',
          'Both should be short, memorable, and inspiring',
          'Align your team around a shared purpose',
        ],
      ),
      LessonModel(
        id: 'f2',
        title: 'Organizational Structure',
        content:
            'An organogram (org chart) defines who reports to whom. Early-stage startups often use a **flat structure** — fewer layers, faster decisions.\n\nAs you grow, you\'ll move toward **functional structures** (HR, Sales, Tech) or **divisional structures** (by product or geography).',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Flat structure = speed and agility',
          'Define roles clearly to avoid confusion',
          'Every team member should know who they report to',
          'Document your org chart early — revisit as you scale',
        ],
      ),
      LessonModel(
        id: 'f3',
        title: 'Licenses & Certificates',
        content:
            'Operating legally from day one protects your startup. Key documents include your **Trade License**, **TIN/Tax Certificate**, **VAT Registration**, and any **sector-specific permits**.\n\nTrack renewal dates carefully — expired licenses can shut down operations.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          'Trade License is mandatory for any business',
          'Track expiry dates for all documents',
          'VAT and TIN registration needed for invoicing',
          'Use a document tracker to stay compliant',
        ],
      ),
      LessonModel(
        id: 'f4',
        title: 'Company Policies',
        content:
            'Policies set the rules of engagement for your team. Start with core policies: **Leave Policy**, **Code of Conduct**, **Data Privacy**, and **Remote Work Policy**.\n\nVersion-control your policies — every change should be documented with an effective date and approver.',
        duration: '5 min',
        type: LessonType.reading,
        keyPoints: [
          'Start with 4-5 essential policies',
          'Version control every policy update',
          'Get employee acknowledgment in writing',
          'Review policies annually or when laws change',
        ],
      ),
      LessonModel(
        id: 'f5',
        title: 'Job Descriptions & Skill Matrix',
        content:
            'A **Job Description (JD)** defines responsibilities, required skills, and reporting lines for each role. A **Skill Matrix** maps what skills your team has vs. what you need — revealing gaps you need to hire for.',
        duration: '8 min',
        type: LessonType.reading,
        keyPoints: [
          'JDs prevent role confusion and conflicts',
          'Skill Matrix identifies hiring needs',
          'Map skills to departments and activities',
          'Update JDs as roles evolve',
        ],
      ),
      LessonModel(
        id: 'f6',
        title: 'Formation Kit Quiz',
        content: 'Test your understanding of company formation basics.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
  KitModel(
    id: 'hr',
    title: 'HR Kit',
    subtitle: 'Build Your Dream Team',
    description:
        'Master recruitment, onboarding, interviews, payroll, and employee lifecycle management.',
    color: AppColors.kitHR,
    icon: Icons.people_rounded,
    totalLessons: 6,
    lessons: [
      LessonModel(
        id: 'hr1',
        title: 'Recruitment Strategy',
        content:
            'Great hiring starts before you post a job. Define the role clearly, identify where your ideal candidates spend time, and build a structured screening process.\n\nUse a **candidate tracker** with 80+ data points: experience, skills, certifications, education, and references.',
        duration: '8 min',
        type: LessonType.reading,
        keyPoints: [
          'Write a clear JD before recruiting',
          'Source from LinkedIn, referrals, and job boards',
          'Screen for culture fit, not just skills',
          'Track every candidate in a standardized format',
        ],
      ),
      LessonModel(
        id: 'hr2',
        title: 'Interview Framework',
        content:
            'Structure your interviews around 25+ criteria: technical skills, communication, leadership, adaptability, and cultural fit.\n\nScore each candidate consistently. Use a **weighted scoring system** to compare candidates objectively and remove hiring bias.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Use a 25-point evaluation framework',
          'Score every candidate on the same criteria',
          'Panel interviews reduce individual bias',
          'Document impressions and recommendations immediately',
        ],
      ),
      LessonModel(
        id: 'hr3',
        title: 'Onboarding Process',
        content:
            'The first 90 days make or break retention. A great onboarding covers: **documentation**, **system access**, **team introductions**, **role training**, and **probation milestones**.\n\nTrack 32+ onboarding checklist items per employee.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          'Day 1: paperwork, access, introductions',
          'Week 1: role training and shadowing',
          'Month 1: first deliverables and check-in',
          '90-day review before confirming employment',
        ],
      ),
      LessonModel(
        id: 'hr4',
        title: 'Payroll & Benefits',
        content:
            'Payroll must be accurate, on time, and compliant. Track **gross salary**, **allowances**, **deductions**, and **net pay** for every employee.\n\nBenefits to consider: Provident Fund, Gratuity, Leave Encashment, Festival Bonus, Transport Allowance.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Payroll accuracy builds trust with employees',
          'Track gross vs. net pay per employee',
          'PF and Gratuity are statutory in many countries',
          'Document all allowances and deductions',
        ],
      ),
      LessonModel(
        id: 'hr5',
        title: 'Employee Verification',
        content:
            'Background verification protects your company. Check: **last employer**, **police records**, **professional references**, **academic credentials**, and **social media presence**.\n\nDocument every check with dates, findings, and approvals.',
        duration: '5 min',
        type: LessonType.reading,
        keyPoints: [
          'Verify all claimed experience and education',
          'Police verification is mandatory for sensitive roles',
          'Check 2-3 professional references personally',
          'Document all verification outcomes',
        ],
      ),
      LessonModel(
        id: 'hr6',
        title: 'HR Kit Quiz',
        content: 'Test your HR management knowledge.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
  KitModel(
    id: 'sop',
    title: 'SOP Kit',
    subtitle: 'Systematize Operations',
    description:
        'Build standard operating procedures for every department — from HR to Engineering to Finance.',
    color: AppColors.kitSOP,
    icon: Icons.checklist_rounded,
    totalLessons: 5,
    lessons: [
      LessonModel(
        id: 's1',
        title: 'What is an SOP?',
        content:
            'A **Standard Operating Procedure (SOP)** is a step-by-step guide for recurring tasks. SOPs ensure consistency, reduce errors, and enable delegation.\n\nEvery SOP should have: a name, process steps, estimated time, and expected output/document.',
        duration: '5 min',
        type: LessonType.reading,
        keyPoints: [
          'SOPs create consistency across the team',
          'Document time estimates per step',
          'Every process should have a clear output',
          'Review SOPs quarterly for improvements',
        ],
      ),
      LessonModel(
        id: 's2',
        title: 'HR & Recruitment SOPs',
        content:
            'The HR SOP covers 265+ steps across manpower planning, job posting, screening, interviewing, onboarding, and exits.\n\nKey time benchmarks: Manpower Planning = 20 min, Job Posting = 30 min, CV Screening = 15 min per candidate.',
        duration: '8 min',
        type: LessonType.reading,
        keyPoints: [
          'Document every recruitment step',
          'Set time SLAs for each HR process',
          'Approval workflows prevent unauthorized hires',
          'Exit SOPs protect IP and data security',
        ],
      ),
      LessonModel(
        id: 's3',
        title: 'Sales & Operations SOPs',
        content:
            'Sales SOPs define the pipeline: lead generation → qualification → proposal → negotiation → close → handoff.\n\nOperations SOPs cover delivery, quality checks, customer support, and issue escalation — ensuring customers get a consistent experience.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Define each sales stage with entry/exit criteria',
          'Document proposal and pricing approval flows',
          'Operations SOPs protect service quality at scale',
          'Escalation paths reduce response time',
        ],
      ),
      LessonModel(
        id: 's4',
        title: 'Finance & Procurement SOPs',
        content:
            'Finance SOPs govern expense approvals, invoicing, and reporting cycles. Procurement SOPs cover vendor selection, purchase requisitions, and payment processing.\n\nApproval matrices define who can approve what — by department and amount.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          'Multi-level approval reduces fraud risk',
          'Invoice SOPs ensure timely payments',
          'Define spend limits by authority level',
          'Monthly reporting SOP keeps leadership informed',
        ],
      ),
      LessonModel(
        id: 's5',
        title: 'SOP Kit Quiz',
        content: 'Test your knowledge of standard operating procedures.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
  KitModel(
    id: 'product',
    title: 'Product Kit',
    subtitle: 'Build the Right Product',
    description:
        'Plan your product roadmap, write BRDs, track features, analyze competitors, and manage your product pipeline.',
    color: AppColors.kitProduct,
    icon: Icons.rocket_launch_rounded,
    totalLessons: 6,
    lessons: [
      LessonModel(
        id: 'p1',
        title: 'Product Strategy',
        content:
            'Before building, validate. Define your product type (B2B/B2C), target market (Niche/Mass/Emerging), and nature (New Development, R&D, Pipeline).\n\nAssess: Total Market Size, Addressable Market, and how much of that market you can realistically capture.',
        duration: '8 min',
        type: LessonType.reading,
        keyPoints: [
          'B2B vs B2C determines your sales motion',
          'TAM → SAM → SOM framework for market sizing',
          'Validate before building — talk to customers',
          'Know your launch timeline: Q1/Q2/Q3/Q4',
        ],
      ),
      LessonModel(
        id: 'p2',
        title: 'Product Roadmap',
        content:
            'A roadmap communicates what you\'re building and when. Use quarterly milestones (Q1-Q4) broken into monthly sprints.\n\nFor each item define: Platform (Web/App/API/AI), Priority (High/Med/Low), Milestone, and Owner.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Roadmaps align product, tech, and business',
          'Prioritize ruthlessly — High/Med/Low',
          'Weekly granularity for near-term work',
          'Status tracking: OPEN → WIP → DONE',
        ],
      ),
      LessonModel(
        id: 'p3',
        title: 'Business Requirements Document',
        content:
            'A **BRD** captures what the business needs from a product — not how to build it (that\'s the TRD). A good BRD includes: problem statement, user stories, functional requirements, and acceptance criteria.',
        duration: '9 min',
        type: LessonType.reading,
        keyPoints: [
          'BRD is for business stakeholders, not engineers',
          'User stories: As a [user], I want [feature], so that [benefit]',
          'Every requirement needs an acceptance criterion',
          'BRD sign-off prevents scope creep',
        ],
      ),
      LessonModel(
        id: 'p4',
        title: 'Competitor Analysis',
        content:
            'Know your competition deeply. Compare on: features, pricing, delivery channels, target market, strengths, and weaknesses.\n\nUse a SWOT framework: 5 Strengths, 5 Weaknesses, 5 Opportunities, 5 Threats per product.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Analyze at least 3-5 direct competitors',
          'Find gaps they\'re not addressing',
          'SWOT: be honest about your weaknesses',
          'Update competitor analysis every quarter',
        ],
      ),
      LessonModel(
        id: 'p5',
        title: 'Revenue Models',
        content:
            'How you charge determines your growth trajectory. Common models: **OTC (one-time charge)**, **Subscription (monthly/annual)**, **MRC (monthly recurring)**, **Pay-per-use**, **Commission-based**.\n\nMost successful startups combine 2-3 models.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          'Subscription = predictable recurring revenue',
          'OTC = higher upfront, harder to forecast',
          'Commission works well for marketplace models',
          'Test pricing with early customers before locking in',
        ],
      ),
      LessonModel(
        id: 'p6',
        title: 'Product Kit Quiz',
        content: 'Test your product management knowledge.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
  KitModel(
    id: 'procurement',
    title: 'Procurement Kit',
    subtitle: 'Source Smartly',
    description:
        'Manage vendors, track purchases, compare prices, and control assets with structured procurement processes.',
    color: AppColors.kitProcurement,
    icon: Icons.local_shipping_rounded,
    totalLessons: 5,
    lessons: [
      LessonModel(
        id: 'pr1',
        title: 'Vendor Management',
        content:
            'Score vendors across 28 criteria in 4 categories: **Quality & Compliance**, **Delivery & Cost**, **Relationship**, and **Innovation**.\n\nA grand total score (1-5 scale) helps you objectively choose and retain the best suppliers.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Evaluate vendors objectively with a scoring matrix',
          'Quality and delivery are the top two criteria',
          'Maintain at least 2 vendors per category',
          'Review vendor scores quarterly',
        ],
      ),
      LessonModel(
        id: 'pr2',
        title: 'Approval Matrix',
        content:
            'Not everyone should approve all purchases. An **approval matrix** defines who can Recommend, Approve, or must be Informed for each spend category.\n\nLevels 1-5 escalate by amount — protecting the company from unauthorized or fraudulent spending.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          '5 authority levels: recommend → approve → inform',
          'Higher spend = higher authority needed',
          'Categories: IT, Marketing, CapEx, Subscriptions, General',
          'Document every approval with date and amount',
        ],
      ),
      LessonModel(
        id: 'pr3',
        title: 'Requisition & Purchase Orders',
        content:
            'Every purchase starts with a **Requisition** (internal request) and gets formalized as a **Purchase Order (PO)**.\n\nTrack: REQ date, department, item, quantity, vendor, PO number, due date, amount paid, and delivery status.',
        duration: '5 min',
        type: LessonType.reading,
        keyPoints: [
          'No purchase without an approved requisition',
          'PO number is your audit trail',
          'Track payment status: paid vs. outstanding',
          'Delivery confirmation closes the loop',
        ],
      ),
      LessonModel(
        id: 'pr4',
        title: 'Asset Management',
        content:
            'Track every company asset: laptops, furniture, vehicles, equipment. Each asset should have: an ID, purchase date, cost, assigned user, condition, and depreciation schedule.',
        duration: '5 min',
        type: LessonType.reading,
        keyPoints: [
          'Assign unique IDs to every asset',
          'Track assigned user and location',
          'Annual asset audits prevent losses',
          'Calculate depreciation for accurate financials',
        ],
      ),
      LessonModel(
        id: 'pr5',
        title: 'Procurement Kit Quiz',
        content: 'Test your procurement and vendor management knowledge.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
  KitModel(
    id: 'business',
    title: 'Business Kit',
    subtitle: 'Win the Market',
    description:
        'Analyze industries, score customers, build pitch decks, evaluate partners, and develop winning sales strategies.',
    color: AppColors.kitBusiness,
    icon: Icons.trending_up_rounded,
    totalLessons: 5,
    lessons: [
      LessonModel(
        id: 'b1',
        title: 'Industry Analysis',
        content:
            'Score industries across 4 dimensions: **Strength** (market size, budget), **Sustainability** (tech adoption, profitability), **Advantage** (uniqueness, partnerships), and **Challenges** (competition, regulation).\n\nPrioritize industries as A (ideal), B (secondary), or C (avoid).',
        duration: '8 min',
        type: LessonType.reading,
        keyPoints: [
          'Score every target industry objectively',
          'A-priority industries get most sales resources',
          'Deployment time affects ROI — shorter is better',
          'Profit potential bands guide pricing strategy',
        ],
      ),
      LessonModel(
        id: 'b2',
        title: 'Customer Scoring Matrix',
        content:
            'Not all customers are equal. Score leads across 6 weighted factors: **Technology Adoption (25%)**, **Network Strength (25%)**, **Potential Challenges (15%)**, **Decision Timeline (15%)**, **Diverse Solutions (5%)**, and **Agreement Timeline (5%)**.\n\nFinal score 0-100 prioritizes which deals to pursue.',
        duration: '9 min',
        type: LessonType.reading,
        keyPoints: [
          'Score customers before investing sales time',
          'Technology adoption is the highest weight (25%)',
          'Network strength = referral and expansion potential',
          'Focus high-effort deals on 70+ scored customers',
        ],
      ),
      LessonModel(
        id: 'b3',
        title: 'Sales Pitch Framework',
        content:
            'A great pitch is structured: **Problem → Solution → Why Us → Proof → Ask**. Each section should be timed — typical pitches are 3-5 minutes.\n\nPrepare key points in both local language and English to reach all stakeholders.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Open with the customer\'s pain, not your product',
          'Social proof (case studies) builds credibility',
          '\"Why us\" must be defensible and specific',
          'Always end with a clear, specific ask',
        ],
      ),
      LessonModel(
        id: 'b4',
        title: 'Partner Evaluation',
        content:
            'Strategic partners can accelerate growth. Evaluate partners on: complementary capabilities, market reach, financial stability, cultural alignment, and mutual benefit.\n\nUse a scoring matrix to compare partnership options objectively.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          'Partners should fill gaps you can\'t fill alone',
          'Formalize partnerships with clear agreements',
          'Define KPIs for every partnership',
          'Review partnership value every 6 months',
        ],
      ),
      LessonModel(
        id: 'b5',
        title: 'Business Kit Quiz',
        content: 'Test your business strategy and market analysis knowledge.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
  KitModel(
    id: 'finance',
    title: 'Finance Kit',
    subtitle: 'Control Your Numbers',
    description:
        'Master P&L, OPEX, CAPEX, 3-year projections, team cost planning, and revenue forecasting.',
    color: AppColors.kitFinance,
    icon: Icons.account_balance_rounded,
    totalLessons: 6,
    lessons: [
      LessonModel(
        id: 'fn1',
        title: 'Profit & Loss (P&L)',
        content:
            'The P&L shows your financial health: **Revenue - Costs = Profit (or Loss)**.\n\nStructure: Gross Revenue → Less VAT → Net Revenue → Less COGS → Gross Profit → Less OPEX → Net Profit.\n\nPlan monthly for Year 1, quarterly for Years 2-3.',
        duration: '9 min',
        type: LessonType.reading,
        keyPoints: [
          'Gross revenue ≠ net revenue (subtract taxes)',
          'COGS are direct costs of delivering your product',
          'OPEX are indirect costs: rent, salaries, marketing',
          'Net profit is what you keep after everything',
        ],
      ),
      LessonModel(
        id: 'fn2',
        title: 'Revenue Planning',
        content:
            'Project revenue bottom-up: # of customers × average deal size × close rate. Build 3 scenarios: **Conservative**, **Base**, and **Optimistic**.\n\nFor a typical early-stage startup: Year 1 = proof of concept, Year 2 = growth, Year 3 = scale.',
        duration: '8 min',
        type: LessonType.reading,
        keyPoints: [
          'Bottom-up forecasting is more credible than top-down',
          'Model 3 scenarios — investors expect this',
          'Year 1 focus: revenue, not profit',
          'Track actual vs forecast monthly',
        ],
      ),
      LessonModel(
        id: 'fn3',
        title: 'OPEX Management',
        content:
            'Operating expenses are your recurring costs. Categories: **Salaries**, **Rent**, **Marketing**, **Technology/Subscriptions**, **Travel**, **Legal**, **Admin**.\n\nAllocate OPEX by department to understand true cost per function.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Salaries are typically 60-70% of startup OPEX',
          'Marketing OPEX should grow with revenue',
          'Tech/subscriptions compound quickly — audit quarterly',
          'Department-level OPEX reveals inefficiencies',
        ],
      ),
      LessonModel(
        id: 'fn4',
        title: 'CAPEX Planning',
        content:
            '**Capital Expenditure (CAPEX)** is investment in long-term assets: servers, equipment, office fit-out, vehicles.\n\nUnlike OPEX, CAPEX is depreciated over time. Plan CAPEX by year — heavy upfront in Year 1, then selective in Years 2-3.',
        duration: '6 min',
        type: LessonType.reading,
        keyPoints: [
          'CAPEX vs OPEX: asset vs. expense',
          'Depreciate CAPEX over useful life',
          'Minimize CAPEX in early stage — lease vs buy',
          'CAPEX should have clear ROI justification',
        ],
      ),
      LessonModel(
        id: 'fn5',
        title: 'Team Cost Planning',
        content:
            'People are your biggest cost. Plan headcount by role, joining date, probation salary, and confirmed salary.\n\nModel year-over-year salary growth and new hires against revenue milestones. Every new hire should have a clear revenue or efficiency justification.',
        duration: '7 min',
        type: LessonType.reading,
        keyPoints: [
          'Plan headcount 6 months ahead',
          'Include benefits in total cost-per-employee',
          'Hire ahead of need, not behind it',
          'Track actual vs planned headcount monthly',
        ],
      ),
      LessonModel(
        id: 'fn6',
        title: 'Finance Kit Quiz',
        content: 'Test your financial planning and analysis knowledge.',
        duration: '5 min',
        type: LessonType.quiz,
        keyPoints: [],
      ),
    ],
  ),
];

// ── Quiz Questions ────────────────────────────────────────────────────────────

final Map<String, List<QuizQuestion>> kitQuizzes = {
  'formation': [
    QuizQuestion(
      question: 'What is the difference between a Vision and a Mission?',
      options: [
        'They are the same thing',
        'Vision is long-term aspiration; Mission is daily purpose',
        'Vision is operational; Mission is strategic',
        'Vision is for investors; Mission is for employees',
      ],
      correctIndex: 1,
      explanation:
          'Vision describes where you want to be in 10+ years. Mission describes what you do every day to get there.',
    ),
    QuizQuestion(
      question: 'What does a "flat organizational structure" mean?',
      options: [
        'The company has no management',
        'Fewer hierarchical layers, enabling faster decisions',
        'All employees earn the same salary',
        'The company operates in one location',
      ],
      correctIndex: 1,
      explanation:
          'Flat structures have fewer layers between leadership and individual contributors, enabling faster decision-making.',
    ),
    QuizQuestion(
      question: 'Why should you version-control company policies?',
      options: [
        'To make documents look professional',
        'Because investors require it',
        'To track changes, effective dates, and approvals over time',
        'To avoid printing new copies',
      ],
      correctIndex: 2,
      explanation:
          'Version control ensures you know what policy was in effect at any point in time, which is critical for compliance and disputes.',
    ),
  ],
  'hr': [
    QuizQuestion(
      question: 'What is the primary purpose of a Skill Matrix?',
      options: [
        'To rank employees by performance',
        'To map existing skills vs. needed skills, revealing hiring gaps',
        'To calculate salaries',
        'To track training attendance',
      ],
      correctIndex: 1,
      explanation:
          'A Skill Matrix shows you exactly which skills your team has and which skills you need to hire for.',
    ),
    QuizQuestion(
      question: 'How many criteria are typically used in a structured interview?',
      options: ['5', '10', '25+', '50+'],
      correctIndex: 2,
      explanation:
          'A comprehensive interview framework evaluates 25+ criteria including technical skills, communication, leadership, and cultural fit.',
    ),
    QuizQuestion(
      question: 'What is the "90-day rule" in onboarding?',
      options: [
        'Employees must stay 90 days before getting benefits',
        'The first 90 days are critical for retention and should be structured with milestones',
        'Probation always lasts 90 days by law',
        'New hires should not be given projects for 90 days',
      ],
      correctIndex: 1,
      explanation:
          'Research shows that 90% of employees decide whether to stay long-term within the first 90 days. Structured onboarding dramatically improves retention.',
    ),
  ],
  'product': [
    QuizQuestion(
      question: 'What does TAM → SAM → SOM stand for?',
      options: [
        'Total Addressable Market → Serviceable Addressable Market → Serviceable Obtainable Market',
        'Target Audience Market → Segmented Audience Market → Specific Obtainable Market',
        'Total Annual Market → Seasonal Addressable Market → Sustainable Online Market',
        'None of the above',
      ],
      correctIndex: 0,
      explanation:
          'TAM is the total market, SAM is the portion you can serve, and SOM is what you can realistically capture in the near term.',
    ),
    QuizQuestion(
      question: 'Which revenue model provides the most predictable income?',
      options: [
        'One-Time Charge (OTC)',
        'Commission-based',
        'Subscription (Monthly/Annual)',
        'Pay-per-use',
      ],
      correctIndex: 2,
      explanation:
          'Subscription revenue is recurring and predictable, making it easier to forecast, plan, and raise investment against.',
    ),
  ],
  'finance': [
    QuizQuestion(
      question: 'What is the formula for Net Revenue?',
      options: [
        'Gross Revenue - OPEX',
        'Gross Revenue - VAT/Tax',
        'Revenue - COGS',
        'Total Sales - Refunds',
      ],
      correctIndex: 1,
      explanation:
          'Net Revenue = Gross Revenue minus taxes (like VAT). It represents the revenue that belongs to the business.',
    ),
    QuizQuestion(
      question: 'What percentage of startup OPEX is typically salaries?',
      options: ['20-30%', '40-50%', '60-70%', '80-90%'],
      correctIndex: 2,
      explanation:
          'In most early-stage startups, salaries and related costs represent 60-70% of total operating expenses.',
    ),
    QuizQuestion(
      question: 'What is the difference between CAPEX and OPEX?',
      options: [
        'CAPEX is monthly; OPEX is annual',
        'CAPEX is investment in long-term assets; OPEX is recurring operational costs',
        'CAPEX is for technology; OPEX is for people',
        'There is no difference',
      ],
      correctIndex: 1,
      explanation:
          'CAPEX is capital invested in assets (servers, equipment) that depreciate over time. OPEX is recurring costs like salaries, rent, and subscriptions.',
    ),
  ],
};
